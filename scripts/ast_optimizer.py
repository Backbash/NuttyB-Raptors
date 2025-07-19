#!/usr/bin/env python3
"""
AST Optimizer for Lua Code
Replaces frequently used table keys with shorter global variables
"""

import sys
import re
from collections import defaultdict
from luaparser import ast, astnodes

def generate_short_name(index):
    """Generate short variable names (a, b, c, ..., z, aa, ab, ...)"""
    chars = "abcdefghijklmnopqrstuvwxyz"
    result = ""
    num = index - 1

    while True:
        result = chars[num % 26] + result
        num = num // 26
        if num == 0:
            break

    return result

def extract_table_accesses(node, accesses=None):
    """Extract frequently used property names from table accesses"""
    if accesses is None:
        accesses = defaultdict(int)

    # Handle Index nodes: expr[key] or expr.key
    if isinstance(node, astnodes.Index):
        # Only extract string keys (property names)
        if isinstance(node.idx, astnodes.String):
            key_name = node.idx.s
            accesses[key_name] += 1

    # Recursively process child nodes
    for child in ast.walk(node):
        if child != node:  # Avoid infinite recursion
            extract_table_accesses(child, accesses)

    return accesses

def replace_table_accesses(node, replacements):
    """Replace frequently used property names with short variables"""

    # Handle Index nodes
    if isinstance(node, astnodes.Index):
        # Replace string keys with variable references
        if isinstance(node.idx, astnodes.String):
            key_name = node.idx.s
            if key_name in replacements:
                # Replace the string key with a variable reference
                node.idx = astnodes.Name(identifier=replacements[key_name])
                # Ensure we use bracket notation (not dot notation)
                node.notation = astnodes.Index.BRACKET

    # Recursively process child nodes
    for field_name, field_value in node.__dict__.items():
        if isinstance(field_value, list):
            for i, item in enumerate(field_value):
                if isinstance(item, astnodes.Node):
                    replace_table_accesses(item, replacements)
        elif isinstance(field_value, astnodes.Node):
            replace_table_accesses(field_value, replacements)

    return None

def optimize_ast(lua_code):
    """Main optimization function"""
    try:
        # Parse the code
        tree = ast.parse(lua_code)

        # Extract frequently used property names
        accesses = extract_table_accesses(tree)

        # Sort by frequency and filter out low-frequency accesses
        sorted_accesses = []
        for property_name, count in accesses.items():
            if count >= 2:  # Only optimize if used at least twice
                sorted_accesses.append((property_name, count))

        sorted_accesses.sort(key=lambda x: x[1], reverse=True)

        # Generate replacements for most frequent property names
        replacements = {}
        var_declarations = []

        for i, (property_name, count) in enumerate(sorted_accesses):
            if i >= 26:  # Limit to first 26 most frequent
                break
            short_name = generate_short_name(i + 1)
            replacements[property_name] = short_name
            var_declarations.append(f"local {short_name} = '{property_name}'")

        # Replace table accesses in the AST
        replace_table_accesses(tree, replacements)

                # Convert back to Lua code
        try:
            optimized_code = ast.to_lua_source(tree)
        except Exception as e:
            print(f"DEBUG: ast.to_lua_source failed: {e}", file=sys.stderr)
            # Fallback to original code if conversion fails
            return lua_code

        # Prepend variable declarations
        if var_declarations:
            optimized_code = '\n'.join(var_declarations) + '\n' + optimized_code
        return optimized_code

    except Exception as e:
        # If optimization fails, return original code
        print(f"AST optimization failed: {e}", file=sys.stderr)
        return lua_code

def main():
    """Command line interface"""
    if len(sys.argv) > 1:
        # Read from file
        with open(sys.argv[1], 'r') as f:
            input_code = f.read()
    else:
        # Read from stdin
        input_code = sys.stdin.read()

    optimized_code = optimize_ast(input_code)
    print(optimized_code, end='')

if __name__ == "__main__":
    main()

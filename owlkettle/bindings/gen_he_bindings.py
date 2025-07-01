import re
import sys

def parse_enums(header):
    enums = []
    enum_pattern = re.compile(r"typedef\s+enum\s*{([^}]*)}\s*([A-Za-z0-9_]+)\s*;")
    for match in enum_pattern.finditer(header):
        body, name = match.groups()
        values = []
        for line in body.split(","):
            line = line.strip()
            if not line or line.startswith("//") or line.startswith("/*"):
                continue
            val = line.split("=")[0].strip()
            if val:
                values.append(val)
        enums.append((name, values))
    return enums

def parse_structs(header):
    structs = set()
    # Opaque typedefs: typedef Name [Lx-y]
    typedef_pattern = re.compile(r"typedef struct \w+ (\w+);")
    for match in typedef_pattern.finditer(header):
        structs.add(match.group(1))
    # Opaque structs: struct _Name [Lx-y]
    struct_pattern = re.compile(r"struct\s+_([A-Za-z0-9_]+)\s*\[L\d+-\d+\]")
    for match in struct_pattern.finditer(header):
        structs.add(match.group(1))
    return sorted(structs)

def parse_functions(header):
    procs = []
    # Matches: return_type function_name ( ... )
    func_pattern = re.compile(r"VALA_EXTERN\s+([A-Za-z0-9_*\s]+)\s+([A-Za-z0-9_]+)\s*\(([^)]*)\)")
    for match in func_pattern.finditer(header):
        ret, name, args = match.groups()
        ret = ret.replace("const", "").replace("struct", "").strip()
        args = args.strip()
        if args == "void" or args == "":
            nim_args = ""
        else:
            nim_args = []
            for arg in args.split(","):
                arg = arg.strip()
                if not arg:
                    continue
                parts = arg.split()
                if len(parts) >= 2:
                    arg_type = " ".join(parts[:-1]).replace("const", "").replace("struct", "").strip()
                    arg_name = parts[-1].replace("*", "")
                    nim_type = ctype_to_nim(arg_type)
                    nim_args.append(f"{arg_name}: {nim_type}")
            nim_args = ", ".join(nim_args)
        nim_ret = ctype_to_nim(ret)
        procs.append((name, nim_args, nim_ret))
    return procs

def ctype_to_nim(ctype):
    ctype = ctype.strip()
    if ctype.endswith("*"):
        return "pointer"
    if ctype in ("void", ""):
        return "void"
    if ctype in ("int", "gint", "gboolean"):
        return "cint"
    if ctype in ("double", "gdouble"):
        return "cdouble"
    if ctype == "char" or ctype == "gchar":
        return "char"
    if ctype == "const gchar*":
        return "cstring"
    if ctype == "gchar*":
        return "cstring"
    if ctype == "const char*":
        return "cstring"
    if ctype == "char*":
        return "cstring"
    if ctype == "void*":
        return "pointer"
    if ctype == "size_t":
        return "csize"
    # fallback: use as is (for enums, typedefs, etc)
    return ctype.replace("struct ", "").replace("const ", "").strip()

def main():
    if len(sys.argv) != 2:
        print("Usage: python gen_he_bindings.py libhelium-1.h")
        sys.exit(1)
    with open(sys.argv[1]) as f:
        header = f.read()

    # # Enums
    # print("# --- ENUMS ---")
    # for name, values in parse_enums(header):
    #     print(f"type\n  {name}* = enum")
    #     for v in values:
    #         print(f"    {v},")
    #     print()

    # # Structs/Opaque types
    # print("# --- OPAQUE TYPES ---")
    # structs = parse_structs(header)
    # print("type")
    # for s in structs:
    #     print(f"  {s}* = distinct pointer")
    # print()

    # Functions
    # print("# --- FUNCTION BINDINGS ---")
    # print("{.push importc, cdecl.}")
    for name, args, ret in parse_functions(header):
        if ret == "void":
            print(f"proc {name}*({args})")
        else:
            print(f"proc {name}*({args}): {ret}")
    # print("{.pop.}")

if __name__ == "__main__":
    main()
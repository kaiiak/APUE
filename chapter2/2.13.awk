#!/usr/bin/awk -f
BEGIN	{
	printf("#include \"apue.h\"\n")
	printf("#include <erron.h>\n")
	printf("#include <limits.h>\n")
	printf("\n")
	printf("static void pr_sysconf(char *, int);\n")
	printf("static void pr_pathconf(char *, char *, int);\n")
	printf("\n")
	printf("int\n")
	printf("main(int argc, char *argv[])\n")
	printf("{\n")
	printf("\tif (argc != 2)\n")
	printf("\t\terr_quit{\"usage: a.out <dirname>\";\n\n")
	FS="\t+"
	while (getline <"sysconf.sym" > 0) {
		printf("#ifdef %s\n", $1)
		printf("\tprintf(\"%s defined to be %%ld\\n", (long)%s+0);\n", $1, $1)
		printf("#else\n")
		printf("\tprintf(\"no symbol for %s\\n");\n", $1)
		printf("#endif\n")
		printf("#ifdef %s\n", $2)
		printf("\tpr_sysconf(\"%s = \", %s);\n", $1, $2)
		printf("#else\n")
		printf("\tprintf(\"no symbol for %s\\n");\n", $2)
		printf("#endif\n")
	}
	close("sysconf.sym")
	while (getline <"pathconf.sym" > 0) {
		printf("#ifdef %s\n", $1)
        printf(" printf(\"%s defined to be %%d\\n\", %s+0);\n", $1, $1)
        printf("#else\n")
        printf(" printf(\"no symbol for %s\\n\");\n", $1)
        printf("#endif\n")
        printf("#ifdef %s\n", $2)
        printf(" pr_pathconf(\"%s =\", argv[1], %s);\n", $1, $2)
        printf("#else\n")
        printf(" printf(\"no symbol for %s\\n\");\n", $2)
        printf("#endif\n")
    }
    close("pathconf.sym")
    exit
	}
END {
    printf(" exit(0);\n")
    printf("}\n\n")
    printf("static void\n")
    printf("pr_sysconf(char *mesg, int name)\n")
    printf("{\n")
    printf(" long val;\n\n")
    printf(" fputs(mesg, stdout);\n")
    printf(" errno = 0;\n")
    printf(" if ((val = sysconf(name)) < 0) {\n")
    printf("  if (errno != 0) {\n")
    printf("   if (errno == EINVAL)\n")
    printf("    fputs(\" (not supported)\\n\", stdout);\n")
    printf("   else\n")
    printf("    err_sys(\"sysconf error\");\n")
    printf("  } else {\n")
    printf("   fputs(\" (no limit)\\n\", stdout);\n")
    printf("  }\n")
    printf(" } else {\n")
    printf("  printf(\" %%ld\\n\", val);\n")
    printf(" }\n")
    printf("}\n\n")
    printf("static void\n")
    printf("pr_pathconf(char *mesg, char *path, int name)\n")
    printf("{\n")
    printf(" long val;\n")
    printf("\n")
    printf(" fputs(mesg, stdout);\n")
    printf(" errno = 0;\n")
    printf(" if ((val = pathconf(path, name)) < 0) {\n")
    printf("  if (errno != 0) {\n")
    printf("   if (errno == EINVAL)\n")
    printf("    fputs(\" (not supported)\\n\", stdout);\n")
    printf("   else\n")
    printf("    err_sys(\"pathconf error, path = %%s\", path);\n")
    printf("  } else {\n")
    printf("   fputs(\" (no limit)\\n\", stdout);\n")
    printf("  }\n")
    printf(" } else {\n")
    printf("  printf(\" %%ld\\n\", val);\n")
    printf(" }\n")
    printf("}\n")
}
}
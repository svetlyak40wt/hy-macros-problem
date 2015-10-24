Checking how HyLang's macroses sometimes can break the traceback.

How to run:

```
virtualenv --python=python3 env
env/bin/pip install hy
env/bin/hy check.py
```

You should see something like that:

```
The Header
Do something useful here
TheFooter
Traceback (most recent call last):
File "env/bin/hy", line 9, in <module>
load_entry_point('hy==0.11.0', 'console_scripts', 'hy')()
File "/Users/art/projects/test-hy-macros-problem/env/lib/python3.5/site-packages/hy/cmdline.py", line 347, in hy_main
sys.exit(cmdline_handler("hy", sys.argv))
File "/Users/art/projects/test-hy-macros-problem/env/lib/python3.5/site-packages/hy/cmdline.py", line 335, in cmdline_handler
return run_file(options.args[0])
File "/Users/art/projects/test-hy-macros-problem/env/lib/python3.5/site-packages/hy/cmdline.py", line 210, in run_file
import_file_to_module("__main__", filename)
File "/Users/art/projects/test-hy-macros-problem/env/lib/python3.5/site-packages/hy/importer.py", line 78, in import_file_to_module
eval(ast_compile(_ast, fpath, "exec"), mod.__dict__)
File "check.hy", line 14, in <module>
(foo)
File "check.hy", line 268, in foo
ZeroDivisionError: division by zero
```

The problem is in the line before the last line: `File "check.hy", line 268, in foo`.
File `check.hy` is much shorter and have no line `268`.

That is the main reason, why I can't use HyLang in any serious project :(

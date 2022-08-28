import sys
import sqlparse
import re


# TODO: Decide what to do about $/?
# contents = contents.replace(f"${identifier}", f"__id_{identifier}")

contents = sys.stdin.read()

contents = re.sub(r"{(\w+)}", r"__identifier__\1", contents)

result = sqlparse.format(
    contents,
    #indent_columns=True,
    #keyword_case="upper",
    #identifier_case="lower",
    #reindent=True,
    #output_format="sql",
    #indent_after_first=True,
    #wrap_after=80,
)

result = re.sub(r"__identifier__(\w+)", r"{\1}", result)

print(result.strip())

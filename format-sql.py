import sys
import sqlparse
import re
from enum import Enum


# TODO: Decide what to do about $/?
# contents = contents.replace(f"${identifier}", f"__id_{identifier}")

contents = sys.stdin.read()

f_string = ""

if contents.startswith("f"):
    f_string = "f"
    contents = contents[1:]

# always return multiline
quote = contents[0]
quotes = 3 * quote

contents = contents.replace(quote, "")

contents = re.sub(r"{(\w+)}", r"__identifier__\1", contents)

result = sqlparse.format(
    contents,
    indent_columns=True,
    keyword_case="upper",
    identifier_case="lower",
    output_format="sql",
    indent_after_first=True,
    wrap_after=120,
)

result = re.sub(r"__identifier__(\w+)", r"{\1}", result)

result = f"{f_string}{quotes}{result}{quotes}"

print(result.strip())

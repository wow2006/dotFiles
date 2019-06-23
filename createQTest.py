#!/usr/bin/env python3
import sys
from jinja2 import Template


if __name__ == "__main__":
    if(len(sys.argv) == 3):
        test_include = sys.argv[1]
        test_name = sys.argv[2]

        with open("qtest.cpp", "r") as f:
            template = Template(f.read())

        print(template.render(test_case=test_name, includes=test_include.split(";")))
    else:
        print("Usage: python %s test_include test_name." % sys.argv[0])
        sys.exit(-1)

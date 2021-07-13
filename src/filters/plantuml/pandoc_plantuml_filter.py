#!/usr/bin/env python3

"""
Pandoc filter to process code blocks with class "plantuml" into
plant-generated images.
Needs `plantuml.jar` from http://plantuml.com/.
"""

import os
import sys
import subprocess

from pandocfilters import toJSONFilter, Para, Image, RawInline
from pandocfilters import get_filename4code, get_caption, get_extension

PLANTUML_BIN = os.environ.get('PLANTUML_BIN', 'plantuml')


def rel_mkdir_symlink(src, dest):
    dest_dir = os.path.dirname(dest)
    if not os.path.exists(dest_dir):
        os.makedirs(dest_dir)

    if os.path.exists(dest):
        os.remove(dest)

    src = os.path.relpath(src, dest_dir)
    os.symlink(src, dest)


def plantuml(key, value, format_, _):
    if key == 'CodeBlock':
        [[ident, classes, keyvals], code] = value

        if "plantuml" in classes:
            caption, typef, keyvals = _get_caption(keyvals, format_)

            filename = get_filename4code("plantuml", code)
            filetype = get_extension(format_, "png", html5="svg", latex="svg", context="svg")

            src = filename + '.uml'
            dest = filename + '.' + filetype

            # Generate image only once
            if not os.path.isfile(dest):
                txt = code.encode(sys.getfilesystemencoding())
                if not txt.startswith(b"@start"):
                    txt = b"@startuml\n" + txt + b"\n@enduml\n"
                with open(src, "wb") as f:
                    f.write(txt)

                # The PlantUML complementary jars (PDF modules) have log messages to stdout that corrupt the JSON stream
                with open('plantUMLErrors.log', "a+") as log_file:
                    subprocess.check_call(PLANTUML_BIN.split() +
                                      ["-t" + filetype, src], stdout=log_file, stderr=log_file)

                sys.stderr.write('Created image ' + dest + '\n')

            # Update symlink each run
            for ind, keyval in enumerate(keyvals):
                if keyval[0] == 'plantuml-filename':
                    link = keyval[1]
                    keyvals.pop(ind)
                    rel_mkdir_symlink(dest, link)
                    dest = link
                    break
            # print('Caption: ', caption, file=sys.stderr)
            return Para([Image([ident, [], keyvals], caption, [dest, typef])])


def to_format(txt : str, fmt : str) -> str:
    # import pypandoc
    # return pypandoc.convert_text(txt, fmt, format='md')
    command = ['pandoc', '-f', 'markdown', '-t', fmt]
    p = subprocess.Popen(command, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    output = p.communicate(input=txt.encode())[0].decode()
    # print("Converted to:", output, file=sys.stderr)
    return output

def _get_caption(item, fmt : str):
    captions, typef, keyvals = get_caption(item)
    for caption in captions:
        if caption['c'] is None and caption['c']:
            continue
        caption['t'] = 'RawInline'
        caption['c'] = [fmt, to_format(caption['c'], fmt)]
    # print('Captions: ', captions, 'typef: ', typef, 'keyvals: ', keyvals, file=sys.stderr)
    return captions, typef, keyvals



def main():
    toJSONFilter(plantuml)


if __name__ == "__main__":
    main()

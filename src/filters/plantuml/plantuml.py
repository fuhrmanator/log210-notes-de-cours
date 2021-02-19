##!/usr/bin/env python

"""
Pandoc filter to process code blocks with class "plantuml" into
plant-generated images.

Needs `plantuml.jar` from http://plantuml.com/.
"""

import os
import shutil
import sys
from subprocess import call

from pandocfilters import toJSONFilter, Para, Image, get_filename4code, get_caption, get_extension


def plantuml(key, value, format, meta):
    # print ('Loading plantuml.py with ', key , ' ' , value , ' format:' , format , file=sys.stderr)
    if key == 'CodeBlock':
        [[ident, classes, keyvals], code] = value

        if "plantuml" in classes:
            caption, typef, keyvals = get_caption(keyvals)

            filename = get_filename4code("plantuml", code)
            filetype = get_extension(format, "png", html="svg", latex="pdf")

            src = filename + '.puml'
            plantuml_output = filename + '.' + filetype

            dest_spec = ""
            # Key to specify final destination the file
            for ind, keyval in enumerate(keyvals):
                if keyval[0] == 'plantuml-filename':
                    dest_spec = keyval[1]
                    keyvals.pop(ind)
                    break

            # Generate image only once
            if not os.path.isfile(plantuml_output):
                txt = code.encode(sys.getfilesystemencoding())
                if not txt.startswith(b"@start"):
                    txt = b"@startuml\n" + txt + b"\n@enduml\n"
                with open(src, "wb") as f:
                    f.write(txt)
                # Must not let messages go to stdout, as it will corrupt JSON in filter
                with open('plantUMLErrors.log', "a+") as log_file:
                    call(["java", "-jar", "filters/plantuml/plantuml.jar", "-t"+filetype, src], stdout=log_file, stderr=log_file)
                sys.stderr.write('Created PlantUML image ' + plantuml_output + '\n')
                if not dest_spec == "": 
                    sys.stderr.write('Copying PlantUML image from ' + plantuml_output + ' to ' + dest_spec + '\n')
                    shutil.copy2(plantuml_output, dest_spec)
                    plantuml_output = dest_spec


            for ind, keyval in enumerate(keyvals):
                if keyval[0] == 'hide-image':
                    if keyval[1] == 'true':
                        sys.stderr.write('INFO: Not showing PlantUML image ' + plantuml_output + '\n')
                        return [] # surpress image in JSON

            return Para([Image([ident, [], keyvals], caption, [plantuml_output, typef])])

if __name__ == "__main__":
    toJSONFilter(plantuml)

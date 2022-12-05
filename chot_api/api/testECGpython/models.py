import json
from .python.ecgdigitize.image  import openImage, decodeImage
from .python.Conversion import convertECGLeads, exportSignals
from .python.model.InputParameters import InputParameters
from .python.model.Lead import Lead, LeadId
from pathlib import Path



def image_path_to_signal(path):
    image = openImage(path)
    extractedSignals, previewImages = convertECGLeads(image, InputParameters(
            rotation=0,
            timeScale=25,
            voltScale=10,
            leads={0: Lead(x=162, y=461, width=396, height=145, startTime=0.0), 1: Lead(x=147, y=1181, width=1946, height=172, startTime=0.0), 2: Lead(x=157, y=786, width=402, height=200, startTime=0.0), 3: Lead(x=690, y=457, width=310, height=159, startTime=0.0), 4: Lead(x=683, y=635, width=368, height=143, startTime=0.0), 5: Lead(x=678, y=804, width=368, height=200, startTime=0.0), 6: Lead(x=176, y=1032, width=1897, height=158, startTime=0.0), 7: Lead(x=1104, y=606, width=450, height=215, startTime=0.0), 8: Lead(x=1109, y=823, width=441, height=170, startTime=0.0), 9: Lead(x=1605, y=461, width=492, height=118, startTime=0.0), 10: Lead(x=171, y=1346, width=1913, height=206, startTime=0.0), 11: Lead(x=1604, y=790, width=449, height=200, startTime=0.0)},
        ))

   
    for key in extractedSignals:
        extractedSignals[key] = list(extractedSignals[key])

    return extractedSignals
    
    # json_object = json.dumps(extractedSignals, allow_nan=False)

    # return json_object
        
    # out_json = json.dumps(outArray)
    # print(out_json)
    # json_file = open("sample.json", "w")
    # n = json_file.write((extractedSignals))
    # json_file.close()
    return json_object #this is dictionary

# str_path = "/Users/calebkim/testECGpython/fullScan.png"
# path = Path(str_path)
# output = (image_path_to_signal(path))
# print((output[0]))

# text_file = open("sample.txt", "w")
# n = text_file.write(output)
# text_file.close()

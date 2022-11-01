import json
from .python.ecgdigitize.image  import openImage
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
            leads={0: Lead(x=84, y=464, width=483, height=185, startTime=0.0), 1: Lead(x=81, y=1235, width=1967, height=206, startTime=0.0), 2: Lead(x=84, y=860, width=489, height=200, startTime=0.0), 3: Lead(x=576, y=485, width=491, height=233, startTime=0.0), 4: Lead(x=576, y=723, width=489, height=200, startTime=0.0), 5: Lead(x=573, y=835, width=489, height=200, startTime=0.0), 6: Lead(x=83, y=1151, width=1962, height=158, startTime=0.0), 7: Lead(x=1066, y=739, width=491, height=277, startTime=0.0), 8: Lead(x=1068, y=923, width=489, height=170, startTime=0.0), 9: Lead(x=1558, y=425, width=492, height=230, startTime=0.0), 10: Lead(x=1558, y=615, width=490, height=241, startTime=0.0), 11: Lead(x=1556, y=869, width=492, height=200, startTime=0.0)},
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
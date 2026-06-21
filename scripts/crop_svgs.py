import os
import xml.etree.ElementTree as ET

ET.register_namespace('', "http://www.w3.org/2000/svg")

icons_dir = r"D:\projects\flora\assets\icons"

for filename in os.listdir(icons_dir):
    if not filename.endswith('.svg'):
        continue
    
    filepath = os.path.join(icons_dir, filename)
    tree = ET.parse(filepath)
    root = tree.getroot()
    
    viewbox = root.get('viewBox')
    if not viewbox:
        continue
        
    parts = viewbox.split()
    if len(parts) != 4:
        continue
        
    # parse the original viewbox
    old_x = float(parts[0])
    old_y = float(parts[1])
    old_w = float(parts[2])
    old_h = float(parts[3])
    
    # We only want to crop ones that are 40x40 or 20x20 or 32x32, basically anything not 24x24
    if old_w == 24 and old_h == 24:
        continue
        
    # Calculate crop offsets to center the 24x24 window within the original canvas
    # The new viewbox will start at old_x + (old_w - 24)/2
    new_x = old_x + (old_w - 24) / 2
    new_y = old_y + (old_h - 24) / 2
    
    # Format the new viewbox
    new_viewbox = f"{int(new_x) if new_x.is_integer() else new_x} {int(new_y) if new_y.is_integer() else new_y} 24 24"
    
    # We DO NOT modify the paths or wrap them in <g>. We just update the root attributes!
    root.set('width', '24')
    root.set('height', '24')
    root.set('viewBox', new_viewbox)
    
    tree.write(filepath, encoding='utf-8', xml_declaration=False)
    print(f"Cropped {filename} to {new_viewbox}")

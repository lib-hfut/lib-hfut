#e16.1BatchInstall.py
import os
libs = {"numpy","matplotlib","pillow","sklearn","requests",\
        "jieba","beautifulsoup4","wheel","networkx","sympy",\
        "pyinstaller","django","flask","werobot","pyqt5",\
        "pandas","pyopengl","pypdf2","docopt","pygame"}
try:
    for lib in libs:
        os.system("pip install "+lib)
    print("Successful")        
except:
    print("Failed Somehow")

#---------- slider avec un bouton reset à droite et un label a gauche
# imports
import sys
from PyQt6.QtWidgets import QWidget, QApplication, QHBoxLayout, QLabel, QSlider, QPushButton
from PyQt6.QtCore import Qt

# ---- AdSlider 

class AdSlider (QWidget):
        # constructeur
        def __init__(self, text:str, defauxvalue:int, minvalue:int, maxvalue:int):
            super().__init__()
            # Stock les arguments
            self.text : str = text
            self.defauxvalue : int = defauxvalue
            self.minvalue : int = minvalue
            self.maxvalue : int = maxvalue
            # attributs : les composant graphiques de AdSlider
            self.topLayout : QHBoxLayout = QHBoxLayout() ; self.setLayout(self.topLayout)
            self.labelText : QLabel = QLabel(self.text)
            self.slider : QSlider = QSlider(Qt.Orientation.Horizontal)
            self.slider.setTickPosition(QSlider.TickPosition.TicksBelow)
            self.slider.setMinimum(self.minvalue) ; self.slider.setMaximum(self.maxvalue) ; self.slider.setValue(self.defauxvalue)
            self.butonReset : QPushButton = QPushButton('reset')
            # --- associer les widget au layout
            self.topLayout.addWidget(self.labelText) ; self.topLayout.addWidget(self.slider) ; self.topLayout.addWidget(self.butonReset)
            # --- show
            self.show()
            
# --- Main: sorte de test unitaire
if __name__ == "__main__":
    app = QApplication = QApplication(sys.argv)
    Slider : AdSlider = AdSlider("info", 5 ,0 ,10)
    sys.exit(app.exec())
# --- import
from ast import arguments
from ctypes import alignment
import sys
from tkinter import HORIZONTAL
from PyQt6.QtWidgets import QApplication, QWidget, QPushButton, QLineEdit, QTextEdit, QLabel, QCalendarWidget, QSlider
from PyQt6.QtWidgets import QVBoxLayout, QHBoxLayout # gestionnaire de positionnement vertical avec QVBoxLatout et en horizontal avec QHBoxLayout
from PyQt6.QtCore import Qt

# --- accès aux écrans
def sSize():
    s = QApplication.screens()[0].size()
    return (s.width(), s.height())
# --- class MaFenetre
class Mafenetre (QWidget):  # herite de QWidget
    #----------------------------------------------
    # Système d'envoie de message
    
    def __init__(self):     # constructeur
        super().__init__()  # appel au constructeur de la classe mère
        self.setWindowTitle(' layout et compagnie ')
        #---------------------------------------------- composant à gauche
        self.nomDuCorrespondant : QLineEdit = QLineEdit("Nom du correspondant") # Création d'une Zone de texte
        self.zoneDeTexte : QTextEdit = QTextEdit("Nom du correspondant")
        self.butonOk : QPushButton = QPushButton("OK") # Création d'un bouton
        #---------------------------------------------- composant centraux
        self.messageH : QLabel = QLabel("saisissez la date d'envoie")
        self.slider : QSlider = QSlider(Qt.Orientation.Vertical)
        self.slider.setTickPosition(QSlider.TickPosition.TicksBothSides)
        self.messageB : QLabel = QLabel("Fait à l'IUT info calais")
        #--------------------------------------------- calendrier
        self.calendrier : QCalendarWidget = QCalendarWidget()
        #--------------------------------------------- Positionnement
        self.topLayout : QHBoxLayout = QHBoxLayout() # gestionnaire de positionnement
        self.gauche : QVBoxLayout = QVBoxLayout()
        self.centre : QVBoxLayout = QVBoxLayout()
        self.droite : QVBoxLayout = QVBoxLayout()
        #--------------------------------------------
        self.setLayout(self.topLayout) #positionement principal donc en horizontal
        #----------- contenaire pour chaque partie
        self.cGauche = QWidget() ; self.cGauche.setLayout(self.gauche)
        self.cCentre = QWidget() ; self.cCentre.setLayout(self.centre)
        self.cDroite = QWidget() ; self.cDroite.setLayout(self.droite)
        #-------------------------------------------
        self.topLayout.addWidget(self.cGauche)
        self.topLayout.addWidget(self.cCentre)
        self.topLayout.addWidget(self.cDroite)
        #-----------------------------------------
        self.gauche.addWidget(self.nomDuCorrespondant)
        self.gauche.addWidget(self.zoneDeTexte)
        self.gauche.addWidget(self.zoneDeTexte)
        self.gauche.addWidget(self.zoneDeTexte)
        self.gauche.addWidget(self.zoneDeTexte)
        self.gauche.addWidget(self.butonOk)
        
        self.centre.addWidget(self.messageH)
        self.centre.addStretch()
        self.centre.addWidget(self.slider)
        self.centre.addStretch()
        self.centre.addWidget(self.messageB)

        self.droite.addStretch()
        self.droite.addWidget(self.calendrier)
        self.droite.addStretch()

        
        
        self.show()         # indespensable !
# --- main
if __name__ == "__main__" :
    app = QApplication(sys.argv) # crée le moteur d'interaction
    w0 : Mafenetre = Mafenetre()
    sys.exit(app.exec())

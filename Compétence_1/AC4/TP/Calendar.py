#import
import sys
from PyQt6.QtWidgets import QApplication, QCalendarWidget
# Accés au écrans
def sSize():
    s = QApplication.screens()[0].size()
    return (s.width(), s.height())

# Class MaFenetre
class Mafenetre (QCalendarWidget): #Hérite de QWidget
    def __init__(self): # Constructeur
        super().__init__() # Appel au constructeur de la classe mère
        self.setWindowTitle("Vivement Demain") # Met de le titre de la fenêtre
        self.move(0,0) # Met la fenêtre en 0 0 par défaut
        
        #self.resize(800,400) # Met une taille par défaut a 800 x 400
        #x,y = sSize() # Sert a avoir la taille de l'écrant pour permettre de mettre la taille de l'écrant a moiter ou autre
        #self.resize(int(x/2),y) # Affiche la fenêtre sur la moitier de l'écrant
        
            
        # Si on met un max et min on ne peux plus mettre en plein écrant
        #self.setMinimumWidth(600) # Largeur MIN
        #self.setMaximumWidth(1000) # Largeur MAX
        #self.setMinimumHeight(400) # Hauteur MIN
        #self.setMaximumHeight(800) # Hauteur MAX
        
        self.show() # Sert afficher la fenêtre INDISPENSABLE

# Main
if __name__ == "__main__":
    app = QApplication(sys.argv) # Crée le moteur d'interraction
    
    w0 : Mafenetre = Mafenetre()
    sys.exit(app.exec()) # Quand la boucle s'arrête python s'arrête aussi
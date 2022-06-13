import sys
from PyQt6.QtWidgets import QWidget, QApplication, QComboBox, QLineEdit, QDateEdit, QTextEdit, QVBoxLayout, QHBoxLayout, QPushButton
from PyQt6.QtCore import Qt, QDate, pyqtSignal
class vueAnnuaire(QWidget):
    # signal
    nextClicked = pyqtSignal()
    previousClicked = pyqtSignal()
    openFileClicked = pyqtSignal(str)
    newClicked = pyqtSignal()
    personneChanged = pyqtSignal(dict)
    saveAsClicked =pyqtSignal(str)
    
    # ---- Constructeur ----
    def __init__(self):
        super().__init__()
        # ---- Titre de la fenêtre ----
        self.setWindowTitle (" Vue Annuaire ")
        # ---- Composant 1er ligne ----
        self.genre : QComboBox = QComboBox()
        self.genre.addItems(["M. ", "Mme ", "_ "])
        
        self.nom : QLineEdit = QLineEdit ("Nom") # Création de la zone de texte pour le nom
        self.prenom : QLineEdit = QLineEdit ("Prenom") # Création de la zone de texte pour le prénom
        
        # ---- Composant 2éme ligne ----
        self.naissance : QDateEdit = QDateEdit()
        self.naissance.setDateRange(QDate(1,1,1),QDate.currentDate())
        
        self.mort : QDateEdit = QDateEdit()
        self.mort.setDateRange(QDate(1,1,1),QDate.currentDate())
        
        # ---- Composant 3éme ligne ----
        self.desc : QTextEdit = QTextEdit("Biographie de la personne")
        
        # ---- Composant 4éme ligne ----
        self.precedent : QPushButton = QPushButton("<< précédent")
        self.load : QPushButton = QPushButton("load")
        self.new : QPushButton = QPushButton("new")
        self.save : QPushButton = QPushButton("save as")
        self.suivant : QPushButton = QPushButton("suivant >>")
        
        # ---- Positionement ----
        self.topLayout : QVBoxLayout = QVBoxLayout()
        self.prmLigne : QHBoxLayout = QHBoxLayout()
        self.scdLigne : QHBoxLayout = QHBoxLayout()
        self.thirdLigne : QHBoxLayout = QHBoxLayout()
        self.dernLigne : QHBoxLayout = QHBoxLayout()
        
        #--------------------------------------------------
        self.setLayout(self.topLayout) #positionement principal donc en horizontal
        
        #----------- contenaire pour chaque partie
        self.cprmLigne = QWidget() ; self.cprmLigne.setLayout(self.prmLigne)
        self.cscdLigne = QWidget() ; self.cscdLigne.setLayout(self.scdLigne)
        self.cthirdLigne = QWidget() ; self.cthirdLigne.setLayout(self.thirdLigne)
        self.cdernLigne = QWidget() ; self.cdernLigne.setLayout(self.dernLigne)
        
        #-------------------------------------------------------------------
        self.topLayout.addWidget(self.cprmLigne)
        self.topLayout.addWidget(self.cscdLigne)
        self.topLayout.addWidget(self.cthirdLigne)
        self.topLayout.addWidget(self.cdernLigne)
        
        #-----------------------------------------
        self.prmLigne.addWidget(self.genre)
        self.prmLigne.addWidget(self.nom)
        self.prmLigne.addWidget(self.prenom)
        
        #-----------------------------------------
        self.scdLigne.addWidget(self.naissance)
        self.scdLigne.addStretch()
        self.scdLigne.addWidget(self.mort)
        
        #-----------------------------------------
        self.thirdLigne.addWidget(self.desc)
        
        #-----------------------------------------
        self.dernLigne.addWidget(self.precedent)
        self.dernLigne.addWidget(self.load)
        self.dernLigne.addWidget(self.new)
        self.dernLigne.addWidget(self.save)
        self.dernLigne.addWidget(self.suivant)
        
        # --- show
        self.show()
        
        
        
# --- Main: sorte de test unitaire
if __name__ == "__main__":
    app = QApplication = QApplication(sys.argv)
    Vueannuaire : vueAnnuaire = vueAnnuaire()
    sys.exit(app.exec())
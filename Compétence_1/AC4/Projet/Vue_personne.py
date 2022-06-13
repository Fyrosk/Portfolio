import sys
from PyQt6.QtWidgets import QWidget, QApplication, QComboBox, QLineEdit, QDateEdit, QTextEdit, QVBoxLayout, QHBoxLayout
from PyQt6.QtCore import Qt, QDate, pyqtSignal
import datetime
import genre as g
from personne import Personne

class vue_Personne (QWidget):
    # ---- Renvoie les signaux ----
    personneChanged :pyqtSignal = pyqtSignal(dict)
    # ---- Constructeur ----
    def __init__(self):
        super().__init__()
        # ---- Titre de la fenêtre ----
        self.setWindowTitle (" Annuaire Vue Personne ")
        # ---- Composant 1er ligne ----
        self.genre : QComboBox = QComboBox()
        self.genre.addItems(["M. ", "Mme ", "_ "])
        
        self.nom : QLineEdit = QLineEdit ("Nom") # Création de la zone de texte pour le nom
        self.prenom : QLineEdit = QLineEdit ("Prenom") # Création de la zone de texte pour le prénom
        
        # ---- Composant 2ème ligne ----
        self.naissance : QDateEdit = QDateEdit()
        self.naissance.setDateRange(QDate(1,1,1),QDate.currentDate())
        
        self.mort : QDateEdit = QDateEdit()
        self.mort.setDateRange(QDate(1,1,1),QDate.currentDate())
        
        # ---- Composant 3ème ligne ----
        self.desc : QTextEdit = QTextEdit("Biographie de la personne")
        
        # ---- Positionement ----
        self.topLayout : QVBoxLayout = QVBoxLayout()
        self.prmLigne : QHBoxLayout = QHBoxLayout()
        self.scdLigne : QHBoxLayout = QHBoxLayout()
        self.derLigne : QHBoxLayout = QHBoxLayout()
        
        #--------------------------------------------------
        self.setLayout(self.topLayout) #positionement principal donc en horizontal
        #----------- contenaire pour chaque partie
        self.cprmLigne = QWidget() ; self.cprmLigne.setLayout(self.prmLigne)
        self.cscdLigne = QWidget() ; self.cscdLigne.setLayout(self.scdLigne)
        self.cDerLigne = QWidget() ; self.cDerLigne.setLayout(self.derLigne)
        
        #-------------------------------------------------------------------
        self.topLayout.addWidget(self.cprmLigne)
        self.topLayout.addWidget(self.cscdLigne)
        self.topLayout.addWidget(self.cDerLigne)
        
        #-----------------------------------------
        self.prmLigne.addWidget(self.genre)
        self.prmLigne.addWidget(self.nom)
        self.prmLigne.addWidget(self.prenom)
        
        #-----------------------------------------
        self.scdLigne.addWidget(self.naissance)
        self.scdLigne.addStretch()
        self.scdLigne.addWidget(self.mort)
        
        #-----------------------------------------
        self.derLigne.addWidget(self.desc)
        
        
        
        # ---- Connexion au callback connecter aux méthodes ----
        self.genre.currentIndexChanged.connect(self.changeGenre)
        self.prenom.editingFinished.connect(self.changePrenom)
        self.nom.editingFinished.connect(self.changeNom)
        self.naissance.dateChanged.connect(self.changeNaissance)
        self.mort.dateChanged.connect(self.changeMort)
        self.desc.textChanged.connect(self.changeBiographie)
        
        self.show()
        
    # ---- Création des callback ----
    def changeGenre(self) -> None:
        self.emitGenre (self.genre.currentText())

    def changePrenom(self) -> None :
        self.emitPrenom (self.prenom.text())

    def changeNom(self) -> None :
        self.emitNom (self.nom.text())

    def changeNaissance(self) -> None :
        self.emitNaiss (self.naissance.date().toPyDate())

    def changeMort(self) -> None :
        self.emitMort (self.mort.date().toPyDate())

    def changeBiographie(self) -> None :
        self.emitDesc (self.desc.toPlainText())
        
    # ---- Emit ----
    def emitGenre (_self, genre) -> None:
        if _self.genre.currentIndexChanged :
            _self.personneChanged.emit ({"nom": _self.nom.text(), "prenom": _self.prenom.text(), "genre": genre, "date_de_naissance": _self.naissance.date(), "date_de_mort": _self.mort.date(), "biographie": _self.desc.toPlainText()})
            
    def emitPrenom(_self, prenom) -> None:
        if _self.prenom.editingFinished :
            _self.personneChanged.emit ({"nom": _self.nom.text(), "prenom": prenom, "genre": _self.genre.currentIndex(), "date_de_naissance": _self.naissance.date(), "date_de_mort": _self.mort.date(), "biographie": _self.desc.toPlainText()})
            
    def emitNom(_self, nom) -> None:
        if _self.nom.editingFinished :
            _self.personneChanged.emit ({"nom": nom, "prenom": _self.prenom.text(), "genre": _self.genre.currentIndex(), "date_de_naissance": _self.naissance.date(), "date_de_mort": _self.mort.date(), "biographie": _self.desc.toPlainText()})
    
    def emitNaiss(_self, naiss) -> None :
        if _self.naissance.dateChanged :
            _self.personneChanged.emit ({"nom": _self.nom.text(), "prenom": _self.prenom.text(), "genre": _self.genre.currentIndex(), "date_de_naissance": naiss, "date_de_mort": _self.mort.date(), "biographie": _self.desc.toPlainText()})
            
    def emitMort(_self, mort) -> None :
        if _self.mort.dateChanged :
            _self.personneChanged.emit ({"nom": _self.nom.text(), "prenom": _self.prenom.text(), "genre": _self.genre.currentIndex(), "date_de_naissance": _self.naissance.date(), "date_de_mort": mort, "biographie": _self.desc.toPlainText()})
            
    def emitDesc(_self, desc) -> None :
        if _self.desc.textChanged :
            _self.personneChanged.emit ({"nom": _self.nom.text(), "prenom": _self.prenom.text(), "genre": _self.genre.currentIndex(), "date_de_naissance": _self.naissance.date(), "date_de_mort": _self.mort.date(), "biographie": desc})
        
    def getAllInfo(self) -> dict :
        dico : dict = {"nom": self.nom, "prenom": self.prenom, "genre": self.genre, "date_de_naissance": self.naissance, "date_de_mort": self.mort, "biographie": self.desc}
        return dico
    
    def updatePersonne(self, prenom: str, nom: str, genre: g.Genre, naissance: datetime.date, mort: (datetime.date), desc: str) -> None :
        self.prenom.setText(prenom) 
        self.nom.setText(nom) 
        self.genre.setCurrentIndex(genre.value)
        self.naissance.setDate(naissance)
        self.mort.setDate(mort)
        self.desc.setText(desc)

            
# --- Main: sorte de test unitaire
if __name__ == "__main__":
    app = QApplication = QApplication(sys.argv)
    Vue_personne : vue_Personne = vue_Personne()
    sys.exit(app.exec())

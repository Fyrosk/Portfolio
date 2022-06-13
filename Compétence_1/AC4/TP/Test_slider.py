import sys
from PyQt6.QtCore import Qt
from PyQt6.QtWidgets import QApplication, QMainWindow, QSlider, QPushButton, QLabel

class MyWindow(QMainWindow):
    
    def __init__ (self) :
        QMainWindow.__init__( self )
        self.setWindowTitle( 'QT Slider with Python' )
        self.resize(320, 150)
    
        self.__slider = QSlider( Qt.Orientation.Horizontal, self )
        self.__slider.setGeometry( 10, 10, 300, 40 )
        self.__slider.valueChanged.connect( self.valueChanged )
        
        self.__button = QPushButton("Reset slider value", self)
        self.__button.setGeometry(10, 50, 230, 35)
        self.__button.clicked.connect( self.resetValue )
        
        self.__label = QLabel( self )
        self.__label.setGeometry(250, 50, 50, 35)
        
        
    def valueChanged( self, value ):
        self.__label.setText( str( value ) )
    
    def resetValue(self):
        self.__slider.setValue( 0 )


if __name__ == "__main__" :
    app = QApplication = QApplication(sys.argv)
    myWindow = MyWindow()
    myWindow.show()
    sys.exit( app.exec() )
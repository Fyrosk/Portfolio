# --- utilisation de AdSLider
import exo101
import sys
from PyQt6.QtWidgets import QApplication, QWidget, QCalendarWidget, QVBoxLayout

#---------------
class Win(QWidget):
    def __init__(self):
        super().__init__()
        self.topLayout : QVBoxLayout = QVBoxLayout() ; self.setLayout(self.topLayout)
        
        self.sliderHaut : exo101.AdSlider = exo101.AdSlider('info', 5, 0, 5)
        self.calendar : QCalendarWidget = QCalendarWidget()
        self.sliderBas : exo101.AdSlider = exo101.AdSlider('info', 3, 0, 15)
        
        self.topLayout.addWidget(self.sliderHaut) ; self.topLayout.addWidget(self.calendar) ; self.topLayout.addWidget(self.sliderBas)
        
        self.show()
        
if __name__ == "__main__":
    app = QApplication = QApplication(sys.argv)
    Slider = Win()
    sys.exit(app.exec())
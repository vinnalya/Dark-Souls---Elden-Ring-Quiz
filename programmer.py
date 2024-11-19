import sys
from PyQt5.QtWidgets import QApplication, QWidget, QGridLayout
from functions import frame1

app = QApplication(sys.argv)

window = QWidget()
window.setWindowTitle("Soul of a Champion: Dark Souls & Elden Ring Quiz")
window.setFixedSize(1000, 800)
window.setStyleSheet("background: #161219;")

grid = QGridLayout()

frame1(grid)

window.setLayout(grid)

window.show()

sys.exit(app.exec())

import mysql.connector
from dotenv import load_dotenv
import os
import random
from PyQt5.QtWidgets import QLabel, QPushButton
from PyQt5.QtWidgets import QSpacerItem, QSizePolicy
from PyQt5.QtGui import QCursor, QPixmap
from PyQt5 import QtCore
import sys


widgets = {
    "logo": [],
    "button": [],
    "score": [],
    "question": [],
    "answer1": [],
    "answer2": [],
    "answer3": [],
    "answer4": [],
    "message": [],
    "message2": []
}


score_value = 0
current_question_index = 0
selected_questions = []


load_dotenv()


def resource_path(relative_path):
    """PyInstaller ile birleştirilen dosyalar için mutlak dosya yolunu döner"""
    try:
        base_path = sys._MEIPASS
    except Exception:
        base_path = os.path.abspath(".")
    return os.path.join(base_path, relative_path)


def connect_db():
    connection = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME"),
        port=os.getenv("DB_PORT", 3306),
        charset='utf8mb4',
        collation='utf8mb4_general_ci'
    )
    return connection


def get_questions_from_db():
    connection = connect_db()
    cursor = connection.cursor()

    query = """
    SELECT q.question_text, a.answer_text, a.is_correct 
    FROM questions q
    JOIN answers a ON q.question_id = a.question_id
    """
    
    cursor.execute(query)
    results = cursor.fetchall()

    questions_dict = {}
    for row in results:
        question, answer, is_correct = row
        if question not in questions_dict:
            questions_dict[question] = []
        questions_dict[question].append((answer, is_correct))

    cursor.close()
    connection.close()

    return questions_dict


def clear_widgets():
    ''' Hide all existing widgets and erase them from the global dictionary '''
    for widget in widgets:
        if widgets[widget] != []:
            widgets[widget][-1].hide()
    for widget in widgets:
        widgets[widget].clear()


def create_buttons(answer, is_correct, l_margin, r_margin, grid):
    button = QPushButton(answer)
    button.setCursor(QCursor(QtCore.Qt.PointingHandCursor))
    button.setFixedWidth(485)
    button.setStyleSheet(
        "*{border: 4px solid '#BC006C';" +
        "margin-left: " + str(l_margin) + "px;" +
        "margin-right: " + str(r_margin) + "px;" +
        "color: white;" +
        "font-family: 'shanti';" +
        "font-size: 16px;" +
        "border-radius: 25px;" +
        "padding: 15px 0;" +
        "margin-top: 20px}" +
        "*:hover{background: '#BC006C'}"
    )
    button.clicked.connect(lambda: check_answer(is_correct, grid))
    return button


def frame1(grid):
    image = QPixmap(resource_path("logo.png"))
    logo = QLabel()
    logo.setPixmap(image)
    logo.setAlignment(QtCore.Qt.AlignCenter)
    logo.setStyleSheet("margin-top: 100px;")
    widgets["logo"].append(logo)

    button = QPushButton("PLAY")
    button.setCursor(QCursor(QtCore.Qt.PointingHandCursor))
    button.setStyleSheet(
        "*{border: 4px solid '#BC006C';" +
        "border-radius: 45px;" +
        "font-size: 35px;" +
        "color: 'white';" +
        "padding: 25px 0;" +
        "margin: 100px 200px;}" +
        "*:hover{background: '#BC006C';}"
    )
    button.clicked.connect(lambda: start_game(grid))
    widgets["button"].append(button)

    grid.addWidget(widgets["logo"][-1], 0, 0, 1, 2)
    grid.addWidget(widgets["button"][-1], 1, 0, 1, 2)


def frame2(grid):
    global current_question_index

    question_text, answers = selected_questions[current_question_index]

    score = QLabel(str(score_value))
    score.setAlignment(QtCore.Qt.AlignCenter)
    score.setFixedSize(100, 100)
    score.setStyleSheet(
        "font-size: 30px; color: 'white'; background: '#64A314'; border-radius: 50px;"
        "border: 4px solid '#64A314'; margin: 10px; padding: 20px;"
    )
    widgets["score"].append(score)

    question = QLabel(question_text)
    question.setAlignment(QtCore.Qt.AlignCenter)
    question.setWordWrap(True)
    question.setStyleSheet(
        "font-family: 'shanti'; font-size: 25px; color: 'white'; padding: 75px;"
    )
    widgets["question"].append(question)

    for idx, (answer, is_correct) in enumerate(answers, start=1):
        button = create_buttons(answer, is_correct, 85, 45, grid)
        widgets[f"answer{idx}"].append(button)

    image = QPixmap(resource_path("logo_bottom.png"))
    logo = QLabel()
    logo.setPixmap(image)
    logo.setAlignment(QtCore.Qt.AlignCenter)
    logo.setStyleSheet("margin-top: 75px; margin-bottom: 30px;")
    widgets["logo"].append(logo)

    grid.addWidget(widgets["score"][-1], 0, 1, QtCore.Qt.AlignRight | QtCore.Qt.AlignTop)
    grid.addWidget(widgets["question"][-1], 1, 0, 1, 2)

    for idx in range(1, 5):
        if f"answer{idx}" in widgets:
            grid.addWidget(widgets[f"answer{idx}"][-1], 2 + (idx - 1) // 2, (idx - 1) % 2)

    grid.addWidget(widgets["logo"][-1], 4, 0, 1, 2)

def start_game(grid):
    global selected_questions, questions_list, score_value, current_question_index

    questions_list = get_questions_from_db()

    if len(questions_list) < 10:
        print("Yeterli sayıda soru yok!")
        return

    selected_questions = random.sample(list(questions_list.items()), 10)

    score_value = 0
    current_question_index = 0
    clear_widgets()
    frame2(grid)


def check_answer(is_correct, grid):
    global score_value, current_question_index
    if is_correct:
        score_value += 10
    
    current_question_index += 1
    
    if current_question_index >= 10:
        show_result(grid)
    else:
        clear_widgets()
        frame2(grid)


def show_result(grid):
    clear_widgets()
    if score_value >= 70:
        frame3(grid)
    else:
        frame4(grid)

#*********************************************
#             FRAME 3 - WIN GAME
#*********************************************
def frame3(grid):
    message = QLabel("Congratulations! You\nare a true Tarnished/Ashen One!\n your score is:")
    message.setAlignment(QtCore.Qt.AlignRight)
    message.setStyleSheet(
        "font-family: 'Shanti'; font-size: 25px; color: 'white'; margin: 100px 0px;"
    )
    widgets["message"].append(message)

    score = QLabel(str(score_value))
    score.setStyleSheet("font-size: 100px; color: #8FC740; margin: 0 75px 0px 75px;")
    widgets["score"].append(score)

    message2 = QLabel("Alright, now go back to the bonfire/grace.")
    message2.setAlignment(QtCore.Qt.AlignCenter)
    message2.setStyleSheet(
        "font-family: 'Shanti'; font-size: 30px; color: 'white'; margin-top:0px; margin-bottom:75px;"
    )
    widgets["message2"].append(message2)

    button = QPushButton('TRY AGAIN')
    button.setStyleSheet(
        "*{background:'#BC006C'; padding:25px 0px; border: 1px solid '#BC006C'; color: 'white'; font-family: 'Arial'; font-size: 25px; border-radius: 40px; margin: 10px 300px;} *:hover{background:'#ff1b9e';}"
    )
    button.setCursor(QCursor(QtCore.Qt.PointingHandCursor))
    button.clicked.connect(lambda: restart_game(grid))
    widgets["button"].append(button)

    logo = QLabel()
    logo.setPixmap(QPixmap(resource_path('logo_bottom.png')))
    logo.setAlignment(QtCore.Qt.AlignCenter)
    logo.setStyleSheet("padding: 10px; margin-top:75px; margin-bottom: 20px;")
    widgets["logo"].append(logo)

    grid.addWidget(widgets["message"][-1], 2, 0)
    grid.addWidget(widgets["score"][-1], 2, 1)
    grid.addWidget(widgets["message2"][-1], 3, 0, 1, 2)
    grid.addWidget(widgets["button"][-1], 4, 0, 1, 2)
    grid.addWidget(widgets["logo"][-1], 5, 0, 2, 2)

#*********************************************
#             FRAME 4 - FAIL
#*********************************************
def frame4(grid):
    message = QLabel("YOU DIED\n your score is:")
    message.setAlignment(QtCore.Qt.AlignRight)
    message.setStyleSheet("font-family: 'Shanti'; font-size: 35px; color: 'white'; margin: 75px 5px; padding:20px;")
    widgets["message"].append(message)

    score = QLabel(str(score_value))
    score.setStyleSheet("font-size: 100px; color: white; margin: 0 75px 0px 75px;")
    widgets["score"].append(score)

    button = QPushButton('TRY AGAIN')
    button.setStyleSheet("*{padding: 25px 0px; background: '#BC006C'; color: 'white'; font-family: 'Arial'; font-size: 35px; border-radius: 40px; margin: 10px 200px;} *:hover{background: '#ff1b9e';}")
    button.setCursor(QCursor(QtCore.Qt.PointingHandCursor))
    button.clicked.connect(lambda: restart_game(grid))
    widgets["button"].append(button)

    logo = QLabel()
    logo.setPixmap(QPixmap(resource_path('logo_bottom.png')))
    logo.setAlignment(QtCore.Qt.AlignCenter)
    logo.setStyleSheet("padding: 10px; margin-top:75px;")
    widgets["logo"].append(logo)

    grid.addWidget(widgets["message"][-1], 1, 0)
    grid.addWidget(widgets["score"][-1], 1, 1)
    grid.addWidget(widgets["button"][-1], 2, 0, 1, 2)
    grid.addWidget(widgets["logo"][-1], 3, 0, 1, 2)


def restart_game(grid):
    start_game(grid)

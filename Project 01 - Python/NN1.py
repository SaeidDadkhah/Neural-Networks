import tkinter as tk

import matplotlib

matplotlib.use('TkAgg')
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg, NavigationToolbar2TkAgg
from matplotlib.backend_bases import key_press_handler
from matplotlib.figure import Figure

import data.moon_dataset


class NNGUI:
    def __init__(self):
        # Make root window
        self.root = tk.Tk()
        self.root.title('Neural Networks: Project 1')
        root_width = 900
        root_height = 580
        screen_width = self.root.winfo_screenwidth()
        screen_height = self.root.winfo_screenheight()
        self.root.geometry('{width}x{height}+{x}+{y}'.format(width=root_width,
                                                             height=root_height,
                                                             x=int((screen_width - root_width) / 2),
                                                             y=int((screen_height - root_height) / 2 - 50)))

        margin = 5

        frame_right_width = 200
        frame_first_height = 180
        frame_second_height = 180
        frame_third_height = 100
        frame_logical_height = 100

        frame_bottom_height = 200
        frame_dataset1_width = 200
        frame_learning_width = 200
        self.__frame_plot = tk.LabelFrame(self.root, text='Plot')
        self.__frame_plot.place(width=-frame_right_width - 2 * margin,
                                height=-frame_bottom_height,
                                x=margin,
                                y=0,
                                relwidth=1,
                                relheight=1,
                                relx=0,
                                rely=0)
        self.__toolbar = None

        frame_dataset1 = tk.LabelFrame(self.root, text='Dataset 1')
        frame_dataset1.place(width=frame_dataset1_width,
                             height=frame_bottom_height - margin,
                             x=margin,
                             y=-frame_bottom_height,
                             relwidth=0,
                             relheight=0,
                             relx=0,
                             rely=1)

        label_r = tk.Label(frame_dataset1, text='r')
        label_r.place(x=5,
                      y=5)

        self.__entry_r = tk.Entry(frame_dataset1)
        self.__entry_r.insert(tk.END, str(data.moon_dataset.defaults['r']))
        self.__entry_r.place(width=165,
                             x=25,
                             y=5)

        label_w = tk.Label(frame_dataset1, text='w')
        label_w.place(x=5,
                      y=30)

        self.__entry_w = tk.Entry(frame_dataset1)
        self.__entry_w.insert(tk.END, str(data.moon_dataset.defaults['w']))
        self.__entry_w.place(width=165,
                             x=25,
                             y=30)

        label_d = tk.Label(frame_dataset1, text='d')
        label_d.place(x=5,
                      y=55)

        self.__entry_d = tk.Entry(frame_dataset1)
        self.__entry_d.insert(tk.END, str(data.moon_dataset.defaults['d']))
        self.__entry_d.place(width=165,
                             x=25,
                             y=55)

        label_number = tk.Label(frame_dataset1, text='number')
        label_number.place(x=5,
                           y=80)

        self.__entry_number = tk.Entry(frame_dataset1)
        self.__entry_number.insert(tk.END, str(data.moon_dataset.defaults['number']))
        self.__entry_number.place(width=135,
                                  x=55,
                                  y=80)

        self.__button_generate_dataset1 = tk.Button(frame_dataset1,
                                                    text='Generate Dataset',
                                                    command=lambda: self.__generate_moon_dataset(
                                                        r=int(self.__entry_r.get()),
                                                        w=int(self.__entry_w.get()),
                                                        d=int(self.__entry_d.get()),
                                                        number=int(self.__entry_number.get())))
        self.__button_generate_dataset1.place(x=10,
                                              y=110)

        frame_learning = tk.LabelFrame(self.root, text='Learning')
        frame_learning.place(width=frame_learning_width,
                             height=frame_bottom_height - margin,
                             x=margin + frame_dataset1_width + margin,
                             y=-frame_bottom_height,
                             relwidth=0,
                             relheight=0,
                             relx=0,
                             rely=1)

        frame_first = tk.LabelFrame(self.root, text='First')
        frame_first.place(width=frame_right_width - margin,
                          height=frame_first_height,
                          x=-frame_right_width,
                          y=0,
                          relwidth=0,
                          relheight=0,
                          relx=1,
                          rely=0)

        frame_second = tk.LabelFrame(self.root, text='Second')
        frame_second.place(width=frame_right_width - margin,
                           height=frame_second_height,
                           x=-frame_right_width,
                           y=frame_first_height + margin,
                           relwidth=0,
                           relheight=0,
                           relx=1,
                           rely=0)

        frame_third = tk.LabelFrame(self.root, text='Third')
        frame_third.place(width=frame_right_width - margin,
                          height=frame_third_height,
                          x=-frame_right_width,
                          y=frame_first_height + margin + frame_second_height + margin,
                          relwidth=0,
                          relheight=0,
                          relx=1,
                          rely=0)

        frame_logical = tk.LabelFrame(self.root, text='Logical Operators')
        frame_logical.place(width=frame_right_width - margin,
                            height=frame_logical_height,
                            x=-frame_right_width,
                            y=frame_first_height + margin + frame_second_height + margin + frame_third_height + margin,
                            relwidth=0,
                            relheight=0,
                            relx=1,
                            rely=0)

        self.root.protocol("WM_DELETE_WINDOW", lambda: self.root.quit())
        self.root.mainloop()

    def __show_figure(self, figure):
        canvas = FigureCanvasTkAgg(figure, self.__frame_plot)
        self.__toolbar = NavigationToolbar2TkAgg(canvas, self.__frame_plot) if self.__toolbar is None else self.__toolbar
        self.__toolbar.canvas =canvas
        self.__toolbar.update()
        canvas.get_tk_widget().place(width=0,
                                     height=-30,
                                     relwidth=1,
                                     relheight=1)

    def __generate_moon_dataset(self, r, w, d, number):
        self.__moon_x, self.__moon_y = data.moon_dataset.generate(r, w, d, number)
        figure = data.moon_dataset.visualize(self.__moon_x, self.__moon_y)
        self.__show_figure(figure)


if __name__ == '__main__':
    nngui = NNGUI()

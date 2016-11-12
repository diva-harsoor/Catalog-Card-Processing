p = 'train_set'
images = []
N = 10
dictionary = {}
for file,subdir,filelist in os.walk(p):
    length = len(filelist)
    for i in range(N):
        fig = plt.figure()
        number = randint(0,length-1)
        file_path = p + "/" + filelist[number]
        im = io.imread(file_path)
        io.imshow(im)
        plt.show()
        text = input("Enter a character or n/a if the image is not a valid character.")
        clear_output()
        if text != "n/a":
            dictionary[filelist[number]] = text

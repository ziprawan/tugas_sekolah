import os
import platform

organ = {
	1 : "Mulut",
	2 : "Kerongkongan",
	3 : "Lambung",
	4 : "Usus 12 Jari",
	5 : "Anus"}
	
materi = {
    1: "Mulut adalah suatu rongga terbuka tempat masuknya makanan dan air. Mulut biasanya terletak di kepala dan umumnya merupakan bagian awal dari sistem pencernaan lengkap yang berakhir di anus. Mulut terdiri dari gigi dan lidah.",
    2: "Kerongkongan atau esofagus adalah tabung otot yang menghubungkan tenggorokan dengan lambung. Kerongkongan memiliki panjang sekitar 20 sentimeter dan dilapisi oleh jaringan merah muda lembap yang disebut mukosa. Kerongkongan tepat berada di belakang (trakea) dan jantung serta di depan tulang belakang.",
    3: "Lambung adalah organ otot yang terletak di sisi kiri perut bagian atas. Lambung menerima makanan dari kerongkongan. Saat makanan mencapai ujung kerongkongan, ia memasuki perut melalui katup otot yang disebut katup kerongkongan bawah. Lambung mengeluarkan asam dan enzim yang mencerna makanan.",
    4: "Usus dua belas jari (bahasa Inggris: duodenum) adalah bagian dari usus halus yang terletak setelah lambung dan menghubungkannya ke usus kosong (jejunum) dengan panjang antara 25–38 cm. Bagian usus dua belas jari merupakan bagian terpendek dari usus halus",
    5: "Anus, dubur, atau lubang bokong (bahasa Latin: ānus) adalah sebuah bukaan dari rektum ke lingkungan luar tubuh. Anus manusia terletak di bagian tengah bokong, bagian posterior dari peritoneum. Pembukaan dan penutupan anus diatur oleh otot sphinkter. Terdapat dua otot sphinkter anal (di sebelah dalam dan luar)."
}

while True:
    if platform.system() == "Windows":
        os.system("cls")
    else:
        # Support for Linux and Mac OS
        os.system("clear")

    print("Berikut beberapa list organ pencernaan, silahkan pilih angka yang ingin dipelajari!")
    print("1. Mulut")
    print("2. Kerongkongan")
    print("3. Lambung")
    print("4. Usus 12 Jari")
    print("5. Anus")
    print("0. Keluar")

    print("")
    inp = input("Pilih organ keberapa : ")

    if not inp.isdigit():
        print("Hanya menerima angka")
        input("Tekan enter untuk melanjutkan")
        continue

    inp = int(inp)

    if inp == 0:
        exit("Program keluar")
    
    if not 0 < inp <= materi.__len__():
        print("Menu tidak tersedia")
        input("Tekan enter untuk melanjutkan")
        continue

    print(organ[inp])
    print(materi[inp])
    print("")

    is_lanjut = input("Lanjut(y/n)?").lower()
    print("\n")

    if is_lanjut == "y":
        continue
    else:
        break
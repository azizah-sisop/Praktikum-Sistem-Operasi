#!/bin/bash
echo "==================================================="
echo "SELAMAT DATANG DI PROGRAM PEMESANAN TIKET BIOSKOP  "
echo "==================================================="
read -p "buat username baru : " user
sudo adduser $user
echo "permintaan anda sedang diproses"
sleep 5s;
echo "user $user berhasil ditambahkan.."
clear
z=0
menu=0
Informasi_Bioskop(){
		echo "---------------------------------------------------"
		echo " 	Jenis film					 "
		echo "---------------------------------------------------"
		echo "1. Romance "
		echo "2. Komedy "
		echo "3. Romance-Komedy "
		echo "4. Horor "
		echo "5. Petualang "
		echo "6. Bollywods "
		echo "7. Best of kids "		
		echo "---------------------------------------------------"
		echo "	Harga Tiket	     				 "
		echo "---------------------------------------------------"
		echo "1. Senin-kamis	= < Rp.30000 			 "
		echo "2. Wekeend	= > Rp.35000			 "
		echo "---------------------------------------------------"
}
Pemesanan(){
            let z=$z+1
            echo -n "Masukkan Nomor Nota		: "
            read nomor[$z]
            echo -n "Masukkan Nomor Loket		: "
            read Loket[$z]
            echo -n "Masukkan Nama Custamer		: "
            read custamer[$z]
            echo -n "Masukkan Nama Petugas		: "
            read petugas[$z]
            echo -n "Masukkan Jenis Film  		: "
            read Jenis[$z]
            echo -n "Masukkan Judul Film 		: "
            read Judul[$z]
            echo -n "Masukkan Nomor Kursi 		: "
            read kursi[$z]
            echo -n "Masukkan Harga/tiket  		: Rp."
            read harga[$z]
            echo -n "Masukkan Jumlah tiket yang dipesan : "
            read jumlah[$z]
            let total[$z]=${harga[$z]}*${jumlah[$z]}
            echo "Total				: Rp.${total[$z]}"
} 
view(){
            for((a=1;a<=z;a++))
            do
			echo "----------------------$a------------------------"
                        echo "Nomor Nota			: ${nomor[$a]}"
                        echo "Nomor Loket			: ${Loket[$a]}"
                        echo "Nama Custamer			: ${custamer[$a]}"
                        echo "Nama Petugas			: ${petugas[$a]}"
                        echo "Jenis Film			: ${Jenis[$a]}"
                        echo "Judul film			: ${Judul[$a]}"
                        echo "Nomor Kursi			: ${kursi[$a]}"
                        echo "Harga/tiket			: Rp.${harga[$a]}"
                        echo "Jumlah tiket yang dipesan 	: ${jumlah[$a]}"
                        echo "Total      			: Rp.${total[$a]}"
            done
}
search(){
            echo -n "Masukkan Nomor Nota : "
            read cari
            a=0
            b=0
            while [ $a -le $z ] && [ $b == 0 ]
            do
                        let a=$a+1
                        if [ "${nomor[a]}" == $cari ]
                        then
                                    b=1
                        fi
            done
} 
pembayaran(){
	search
	if [ $a -le $z ]
	then
			echo "Nomor Nota			: ${nomor[$a]}"
                        echo "Nomor Loket			: ${Loket[$a]}"
                        echo "Nama Custamer			: ${custamer[$a]}"
                        echo "Nama Petugas			: ${petugas[$a]}"
                        echo "Jenis Film			: ${Jenis[$a]}"
                        echo "Judul film			: ${Judul[$a]}"
                        echo "Nomor Kursi			: ${kursi[$a]}"
                        echo "Harga/tiket			: Rp.${harga[$a]}"
                        echo "Jumlah tiket yang dipesan 	: ${jumlah[$a]}"
                        echo "Total      			: Rp.${total[$a]}"
			echo "----------------------------------------------------"
			echo -n "Masukkan nominal pembayaran	: Rp."
			read bayar[$a]
			if [ ${bayar[$a]} -lt ${total[$a]} ]
			then 
			echo "--------------- Uang tidak cukup -------------------"
			elif [ ${bayar[$a]} -eq ${total[$a]} ]
			then
			echo "------------------- Uang Cukup ---------------------"
			else
			let kembali[$a]=${bayar[$a]}-${total[$a]}
			echo -n "Kembalian 			: Rp.${kembali[$a]}"
			fi
	else
		echo "Data tidak ada"	
	fi
}
UbahPemesanan(){
            search
            if [ $a -le $z ]
            then
                        echo "-------------------------------------------------"
                        echo "Jenis Film		: ${Jenis[$a]}"
                        echo "Judul film		: ${Judul[$a]}"
                        echo "Nomor Kursi		: ${kursi[$a]}"
                        echo "Harga/tiket		: Rp.${harga[$a]}"
                        echo "Jumlah tiket yang dipesan: ${jumlah[$a]}"
                        echo "Total			: Rp.${total[$a]}"
                        echo "-------------------------------------------------"
            		echo -n "Masukkan Jenis Film			: "
            		read Jenis[$a]
            		echo -n "Masukkan Judul Film 			: "
            		read Judul[$a]	
            		echo -n "Masukkan Nomor Kursi 			: "
            		read kursi[$a]
            		echo -n "Masukkan Harga/tiket  			: Rp."
            		read harga[$a]
            		echo -n "Masukkan Jumlah tiket yang dipesan	: "
            		read jumlah[$a]
            		let total[$a]=${harga[$a]}*${jumlah[$a]}
            		echo "Total					: Rp.${total[$a]}"
            else
                        echo "Data Tidak Ada"
            fi
} 
delete(){
            search
            if [ $a -gt $z ]
            then
                        echo "Data Tidak Ada"
            else
                        while [ $a -lt $z ]
                        do
                                    let b=$a+1
                                    nomor[$a]=${nomor[$b]}
                                    loket[$a]=${loket[$b]}
                                    custamer[$a]=${custamer[$b]}
                                    petugas[$a]=${petugas[$b]}
                                    jenis[$a]=${jenis[$b]}
                                    judul[$a]=${judul[$b]}
                                    kursi[$a]=${kursi[$b]}
                                    harga[$a]=${harga[$b]}
                                    jumlah[$a]=${jumlah[$b]}
                                    total[$a]=${total[$b]}
                                    let a=$a+1
                        done
                        let z=$z-1
                        echo "Data $cari Berhasil Dihapus"
            fi
} 
cetak(){
            search
            if [ $a -le $z ]
            then
                        echo "-------------------------------------------"
                        echo "Nomor Nota		: ${nomor[$a]}"
                        echo "Nomor Loket		: ${Loket[$a]}"
                        echo "Nama Custamer		: ${custamer[$a]}"
                        echo "Nama Petugas		: ${petugas[$a]}"
                        echo "Jenis Film		: ${Jenis[$a]}"
                        echo "Judul film		: ${Judul[$a]}"
                        echo "Nomor Kursi		: ${kursi[$a]}"
                        echo "Harga/tiket		: Rp.${harga[$a]}"
                        echo "Jumlah tiket yang dipesan : ${jumlah[$a]}"
                        echo "Total			: Rp.${total[$a]}"
                        echo "-------------------------------------------"
            else
                        echo "Data Tidak Ada"
            fi
} 
while [ $menu != 8 ]
do
            echo "==================================================="
            echo "SELAMAT DATANG DI PROGRAM PEMBELIAN TIKET BIOSKOP  "
            echo "==================================================="  
            echo "1.Informasi Bioskop"
            echo "2.Pemesanan"
            echo "3.View"
            echo "4.Pembayaran"
            echo "5.Ubah Pemesanan"   
            echo "6.Delete"
            echo "7.Cetak"
            echo "8.Exit"
            echo -n " pilih Menu ? "
            read menu
            if [ $menu -eq 1 ]
            then
                        Informasi_Bioskop
            elif [ $menu -eq 2 ]
            then
                        Pemesanan 
            elif [ $menu -eq 3 ]
            then
                        if [ $z -lt 1 ]
                        then
                                    echo "kosong "
                        else
                                    view
                        fi
            elif [ $menu -eq 4 ]
            then
                        pembayaran
            elif [ $menu -eq 5 ]
            then
                        UbahPemesanan
            elif [ $menu -eq 6 ]
            then
                        delete
	    elif [ $menu -eq 7 ]
            then
                        cetak
            elif [ $menu -eq 8 ]
            then
            echo "===================================================" 
                        echo "		TERIMA KASIH 	"  
            echo "==================================================="         
            else
                        echo "Salah "
            fi
            echo "	 "
done
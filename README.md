
# MIKTI TEAM CHALLENGE

This project is developed as part of the MIKTI Studi Independen Team Challenge. The goal of the challenge is to create a REST API using Go and GORM as the ORM. The API is designed to support a small e-commerce platform where users can act as both sellers and buyers.

## Features

- User Management: Allows users to register and manage their profiles.
- Product Management: Enables users to add, update, and delete products.
- Transaction Management: Facilitates the process of creating and managing transactions between sellers and buyers.
- CRUD Operations: Supports Create, Read, Update, and Delete operations for all entities.


## Tech Stack

- [Go](https://go.dev/): The programming language used to develop the API.
- [GORM](https://gorm.io/): The ORM library used for database operations.
- [PostgreSQL](https://www.postgresql.org/): The database used to store the application data (choose one based on your setup).
- [Echo](https://echo.labstack.com/): The web framework used to handle HTTP requests and routing.


## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`DB_POSTGRES_URL`=`postgres://postgres:postgres@localhost:5432/postgres?`

## Documentations
### Flowcharts

#### Login Flowchart
![Login Flowchart](https://github.com/alfi-dim/MIKTI-TEAM-Challenge/blob/master/docs/img/flowchart_login.png?raw=true)

Flowchart Login:

1. Mulai Proses Login:  
    User mulai melakukan proses login, dengan menggunakan akun berdasarkan rolenya. Jika tidak memiliki akun, maka user harus membuat akun terlebih dahulu.

2. Membuat akun:  
    User membuat akun dengan memasukkan data yang diperlukan untuk login ke sistem.

3. Login ke Sistem:  
    User login menginputkan username dan password yang sesuai dengan yang terdaftar di database.

4. Validasi email dan password:  
    Sistem akan melakukan validasi, jika username dan password yang dimasukkan benar sesuai dengan database. Jika tidak valid maka sistem akan merespon pesan tidak valid.

5. Generate JWT token:  
    Jika username dan password valid, sistem akan generate JWT token.

6. Berhasil Login.  
    User berhasil login sesuai dengan rolenya.


#### Transactions Flowchart
![Transactions Flowchart](https://github.com/alfi-dim/MIKTI-TEAM-Challenge/blob/master/docs/img/flowchart_transactions.png?raw=true)

Flowchart Transaksi:

1. User (Seller atau Buyer) Memulai Proses:  
    User memulai proses transaksi, baik sebagai seller yang ingin menambahkan barang atau sebagai buyer yang ingin memesan barang.

2. Seller Menambahkan Barang:  
    Jika user adalah seller, dapat mengirimkan permintaan untuk menambahkan barang.

3. Validasi Input Seller:  
    Sistem memvalidasi input dari seller. Jika input tidak valid, sistem merespons dengan pesan error validasi. Jika valid, sistem menambahkan barang ke database dan merespons dengan pesan sukses.

4. Buyer Memesan Barang:  
    Jika user adalah buyer, dapat mengirimkan permintaan untuk memesan barang.

5. Validasi Input Order:  
    Sistem memvalidasi input order dari buyer. Jika input tidak valid, sistem merespons dengan pesan error validasi.

6. Validasi Stok Barang:  
    Jika input valid, sistem memeriksa ketersediaan barang di database. Jika barang tidak tersedia dalam jumlah yang cukup, sistem merespons dengan pesan stok barang kosong.

7. Kurangi Stok Barang di Database:  
    Jika barang tersedia, sistem mengurangi jumlah barang di database sesuai dengan jumlah yang dipesan.

8. Respon Order Berhasil:  
    Sistem akan merespons buyer dengan pesan sukses, jika stok barang ada dan berhasil di order.

### ERD
![ERD](https://github.com/alfi-dim/MIKTI-TEAM-Challenge/blob/master/docs/img/erd.png?raw=true)

ERD di atas menggambarkan sistem penjualan barang yang terdiri dari 4 entitas: User, Barang, Transaksi, dan Item Transaksi. Entitas-entitas tersebut terhubung satu sama lain dengan berbagai jenis hubungan, seperti one-to-many dan many-to-many. ERD ini dapat digunakan sebagai panduan untuk merancang dan mengembangkan database sistem penjualan barang.

Penjelasan Entitas

- User:

    Entitas ini mewakili pengguna sistem, seperti pembeli dan penjual.

* Atribut:
    * ID: ID unik untuk setiap user.
    * Nama: Nama user.
    * Username: Username untuk login ke sistem.
    * Password: Password untuk login ke sistem.
    * Role: Role user, seperti kasir atau admin.
    * Alamat: Alamat user.
    * No.HP: Nomor HP user.

* Barang:
  
    Entitas ini mewakili barang yang dijual oleh toko.

* Atribut:
  * ID: ID unik untuk setiap barang.
  * Nama: Nama barang.
  * Harga: Harga jual barang.
  * Stok: Jumlah stok barang yang tersedia.

* Transaksi:

    Entitas ini mewakili transaksi penjualan yang dilakukan di toko.

* Atribut:
  * ID: ID unik untuk setiap transaksi.
  * ID Buyer: ID user yang membeli barang.
  * ID Seller: ID user yang menjual barang.
  * Total_amount: Total amount dari transaksi.
  * Date: Tanggal transaksi.
  * Status: Status transaksi, seperti "pending" atau "completed".
* Item Transaksi:

    Entitas ini mewakili detail dari setiap transaksi penjualan.

* Atribut:
  * ID: ID unik untuk setiap item transaksi.
  * ID Transaksi: ID transaksi yang terkait dengan item transaksi.
  * ID Barang: ID barang yang dibeli dalam transaksi.
  * Qty: Quantity barang yang dibeli.
  * Amount: Amount dari item transaksi.

Penjelasan Hubungan Antar Entitas

* User - Transaksi:  
    Relasi: One-to-many  
    Keterangan: Seorang user dapat melakukan banyak transaksi.
* Barang - Transaksi:  
  Relasi: Many-to-many  
  Keterangan: Sebuah barang dapat dibeli dalam banyak transaksi, dan sebuah transaksi dapat membeli banyak barang.
* User - Barang:  
  Relasi: One-to-many  
  Keterangan: Seorang user dapat memiliki banyak barang, dan sebuah barang hanya dapat dimiliki oleh satu user.

## Contributors

Thanks to these wonderful people who have contributed to this project:

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/alfi-dim">
        <img src="https://github.com/alfi-dim.png" width="50px;" alt="alfi-dim"/>
        <br />
        <sub><b>alfi-dim</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/indrasee">
        <img src="https://github.com/indrasee.png" width="50px;" alt="indrasee"/>
        <br />
        <sub><b>indrasee</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/kibarrr29">
        <img src="https://github.com/kibarrr29.png" width="50px;" alt="kibarrr29"/>
        <br />
        <sub><b>kibarrr29</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/onainadapdap1">
        <img src="https://github.com/onainadapdap1.png" width="50px;" alt="onainadapdap1"/>
        <br />
        <sub><b>onainadapdap1</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/wahyunahdaputra">
        <img src="https://github.com/wahyunahdaputra.png" width="50px;" alt="wahyunahdaputra"/>
        <br />
        <sub><b>wahyunahdaputra</b></sub>
      </a>
    </td>
  </tr>
</table>


## License

[MIT](https://choosealicense.com/licenses/mit/)


# Dokumentasi API

API ini digunakan untuk mengontrol lampu lalu lintas di beberapa jalur sekaligus.

## Endpoints

### 1. **Normal Mode**
   Mengaktifkan mode lampu lalu lintas normal.
   - **URL:** `/normal`
   - **Method:** `GET`
   - **Respon Sukses:**
     ```json
     {
       "status": 200,
       "message": "Normal traffic light sequence started."
     }
     ```

### 2. **Aktifkan Lampu Hijau**
   Mengaktifkan lampu hijau untuk jalur tertentu.
   - **URL:** `/green?road={nomor_jalur}`
   - **Method:** `GET`
   - **Parameter:** 
     - `road` (int) - Nomor jalur yang ingin diaktifkan (1, 2, 3, 4)
   - **Respon Sukses:**
     ```json
     {
       "status": 200,
       "message": "Green light activated for road {nomor_jalur}."
     }
     ```
   - **Respon Gagal:**
     ```json
     {
       "status": 400,
       "message": "Invalid road specified."
     }
     ```

### 3. **Mode Kuning Kelap-Kelip**
   Mengaktifkan mode kuning kelap-kelip untuk semua jalur.
   - **URL:** `/blink`
   - **Method:** `GET`
   - **Respon Sukses:**
     ```json
     {
       "status": 200,
       "message": "Traffic light blinking sequence started."
     }
     ```

## Contoh Penggunaan

### Mengaktifkan Mode Normal
```http
GET /normal
```

### Mengaktifkan Lampu Hijau untuk Jalur 1
```http
GET /green?road=1
```

### Mengaktifkan Mode Kuning Kelap-Kelip
```http
GET /blink
```

---
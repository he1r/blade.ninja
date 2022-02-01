class Databazat {
  static const defaultUrl = 'https://blade.ninja/update';
  static const databazat = [
    [
      "Gjendja Civile 2008",
      [
        ['Emri', 0, 'Emri'],
        ['Mbiemri', 0, 'Mbiemri'],
        ['Atesia', 0, 'Atesia'],
        ['Amesia', 0, 'Amesia'],
        ['Datelindja', 1, 'Datelindja'],
        ['Id Kryefamiljari', 0, 'Id Kryefamiljari']
      ]
    ],
    [
      "Patronazhisti 2021",
      [
        ['Emri', 0, 'Emri'],
        ['Mbiemri', 0, 'Mbiemri'],
        ['Atesia', 0, 'Atesia'],
        ['Datelindja', 1, 'Datelindja'],
        ['Telefoni', 1, 'Tel'],
        ['Numri Personal', 0, 'NID']
      ]
    ],
    [
      "Targat 2021",
      [
        ['Targa', 1, 'Targa'],
        ['Emri', 0, 'Emri'],
        ['Mbiemri', 0, 'Mbiemri'],
        ['ID Pronari', 0, 'ID Pronari']
      ]
    ],
    [
      "Targat + Patronazhisti 2021",
      [
        ['Targa', 1, 'Targa'],
        ['Emri', 0, 'Emri'],
        ['Mbiemri', 0, 'Mbiemri'],
        ['Telefoni', 1, "Tel"],
        ['ID Pronari', 0, 'ID Pronari']
      ]
    ],
    [
      "Rrogat Prill",
      [
        ['Emri', 0, 'Emri'],
        ['Mbiemri', 0, 'Mbiemri'],
        ['Numri Personal', 0, 'NID'],
        ['NIPT', 0, 'NIPT'],
        ['Subjekti', 1, 'Subjekti']
      ]
    ],
  ];

  static Map familyJSON = {
    "db": 0,
    "Emri": [false, null],
    "Mbiemri": [false, null],
    "Atesia": [false, null],
    "Amesia": [false, null],
    "Datelindja": [1, ""],
//    "Id_Kryefamiliari": [
//      0,
//      // id should be inserted manually
//    ]
  };
}

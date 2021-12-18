/* Tugas Kelompok TIK
 * SMAN 1 Bekasi
 * 
 * Thanks to our teacher
 * Bu Deswati
 * 
 * Kelompok:
 * Aziz Ridhwan Pratama
 * Estevan Ezekiel Silitonga
 * Faris Rafie Syahzani
 * Haviezh Farelldiq Husin
 * Riquel Athallah Putra Adhitia
 * 
 * Kode sederhana hand sanitizer
 *
 * Semoga bermanfaat
*/

#include <Servo.h>
Servo servo1, servo2;

// Defining some variables
int angle = 0;
int angleStep = 50;
const int pin1 = 7;
const int pin2 = 8;

void setup() {
  // setup
  servo1.attach(pin1);
  servo2.attach(pin2);
  pinMode(2, INPUT_PULLUP);

}

void loop() {
  // Loop code
  if (digitalRead(2) == HIGH) {
    servo1.write(180); // Buat servo berputar
    servo2.write(180);
  } else {
    servo1.write(-180); // Buat servo berputar balik
    servo2.write(-180);
  }

}

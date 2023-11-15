/**
 * Diberikan dua letiable angka bertipe number yaitu angka1 dan angka2.
 * Buatlah program yang membandingkan kedua angka tersebut. Jika angka2 lebih
 * besar dari angka1 maka tampilkan nilai true, dan false jika sebaliknya.
 * Jika kedua angka bernilai sama, maka tampilkan -1.
 */

const num_1 = Number.parseInt(prompt("angka 1"));
const num_2 = Number.parseInt(prompt("angka 2"));

if (!(num_1 && num_2)) {
  alert("Cannot proccess your input!");
}

if (num_1 === num_2) {
  alert(-1);
}

if (num_2 > num_1) {
  alert(true);
}

if (num_2 < num_1) {
  alert(false);
}

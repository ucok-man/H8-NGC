function randomArr(length, maxnum) {
  const result = [];
  for (let i = 0; i < length; i++) {
    result.push(Math.floor(Math.random() * maxnum) + 1);
  }
  return result;
}

/* ---------------------------------------------------------------- */
/*                          Deret Geometri                          */
/* ---------------------------------------------------------------- */
function tentukanDeretGeometri(arr) {
  if (arr.length < 2) {
    return false;
  }

  const konstanta = arr[1] / arr[0];
  let result = true;
  for (let i = 1; i < arr.length; i++) {
    if (arr[i] % konstanta !== 0) {
      result = false;
      break;
    }
  }
  return result;
}

console.log("Deret Geometri Start");
console.log(tentukanDeretGeometri([1, 3, 6, 9, 12]));
console.log(tentukanDeretGeometri(randomArr(10, 100)));
console.log("Deret Geometri End");

/* ---------------------------------------------------------------- */
/*                       pengelompokan angka2                       */
/* ---------------------------------------------------------------- */
function mengelompokanAngka(arr) {
  if (arr.length < 1) {
    return arr;
  }

  const evens = [];
  const odds = [];
  const geometrics = [];
  for (let i = 0; i < arr.length; i++) {
    const val = arr[i];
    if (val % 2 === 0) {
      evens.push(val);
    }
    if (val % 2 === 1) {
      odds.push(val);
    }
    if (val % 3 === 0) {
      geometrics.push(val);
    }
  }

  const result = [];
  result.push(evens);
  result.push(odds);
  result.push(geometrics);
  return result;
}

console.log("Pengelompokan Angka Start");
console.log(mengelompokanAngka(randomArr(10, 100)));
console.log(mengelompokanAngka(randomArr(10, 100)));
console.log("Pengelompokan Angka End");

/* ---------------------------------------------------------------- */
/*                        pengelompokan kursi                       */
/* ---------------------------------------------------------------- */
function sittingArranggement(persons, column) {
  if (column < 1) {
    return "Invalid Number";
  }

  const result = [];

  let count = 0;
  while (persons.length > 0) {
    const kursi = [];
    //
    while (count < column) {
      const person = persons.pop();
      if (person) {
        kursi.push(person);
      } else {
        kursi.push("Bangku Angker");
      }
      count++;
    }
    //
    result.push(kursi);
    count = 0;
  }

  return result;
}

console.log("Sitting Arranggement Start");
console.log(sittingArranggement(["a", "b", "c"], 3));
console.log(sittingArranggement(["a", "b", "c", "d"], 3));
console.log("Sitting Arranggement End");

/* ---------------------------------------------------------------- */
/*                              ladder                              */
/* ---------------------------------------------------------------- */
function ladder(str) {
  if (str.length <= 0) {
    return "Invalid Parameter";
  }

  const result = [];
  let maxidx = str.length;
  while (maxidx > 0) {
    const cache = [];
    for (let i = 0; i < maxidx; i++) {
      cache.push(str[i]);
    }
    result.push(cache);
    maxidx--;
  }
  return result;
}

console.log("Ladder Start");
console.log(ladder("budi"));
console.log(ladder("tono lagi makan"));
console.log("Ladder End");

/* ---------------------------------------------------------------- */
/*                          target terdekat                         */
/* ---------------------------------------------------------------- */
function targetTerdekat(arr) {
  const x_idxs = [];
  let o_idx = 0;
  let count_o = 0;
  for (let i = 0; i < arr.length; i++) {
    const val = arr[i].toLowerCase();
    if (val === "o") {
      o_idx = i;
      count_o++;
    }
    if (val === "x") {
      x_idxs.push(i);
    }
  }

  if (x_idxs.length <= 0 || count_o > 1) {
    return 0;
  }

  let minSpace = Number.MAX_VALUE;
  for (let i = 0; i < x_idxs.length; i++) {
    const x_idx = x_idxs[i];
    const currentSpace = Math.abs(o_idx - x_idx);
    if (currentSpace < minSpace) {
      minSpace = currentSpace;
    }
  }
  return minSpace;
}

console.log("Target Terdekat Start");
console.log(targetTerdekat(["o", "", "o", "", "", "", "x"]));
console.log(targetTerdekat(["o", "", "", "", "", "", ""]));
console.log(targetTerdekat(["x", "", "", "o", "", "x", ""]));
console.log(targetTerdekat(["x", "", "", "o", "x", "", ""]));
console.log("Target Terdekat End");

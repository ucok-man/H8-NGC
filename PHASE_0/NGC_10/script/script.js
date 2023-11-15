function check(obj) {
  if (!(obj.score > 75)) {
    return null;
  }
  return (result = {
    name: obj.name,
    score: obj.score,
  });
}

function graduates(objs) {
  const result = {};
  for (const obj of objs) {
    const fullfill = check(obj);
    if (!fullfill) {
      continue;
    }

    const key = obj.class;
    if (result[key] === undefined) {
      result[key] = [];
    }

    result[key].push(fullfill);
  }

  return result;
}

/* ---------------------------------------------------------------- */
/*                           test function                          */
/* ---------------------------------------------------------------- */

const input1 = [
  {
    name: "Alexei",
    score: 85,
    class: "wolves",
  },
  {
    name: "Anastasia",
    score: 78,
    class: "wolves",
  },
  {
    name: "Dimitri",
    score: 90,
    class: "foxes",
  },
  {
    name: "Sergei",
    score: 74,
    class: "foxes",
  },
];
console.log("hasil akhir: ", graduates(input1));

const input2 = [
  {
    name: "Alexander",
    score: 100,
    class: "foxes",
  },
  {
    name: "Alisa",
    score: 76,
    class: "wolves",
  },
  {
    name: "Vladimir",
    score: 92,
    class: "foxes",
  },
  {
    name: "Albert",
    score: 71,
    class: "wolves",
  },
  {
    name: "Viktor",
    score: 80,
    class: "tigers",
  },
];
console.log("hasil akhir: ", graduates(input2));

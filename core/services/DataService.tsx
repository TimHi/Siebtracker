export class DataService {
  getAllCoffees() {
    return fetch('http://localhost:10000/coffees')
      .then(response => response.json())
      .then(json => {
        console.log(json);
      })
      .catch(error => {
        console.error(error);
      });
  }
}

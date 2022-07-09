export class User {
  Id: string;
  Name: string;
  Image: string;
  constructor(id: string, name: string, image: string) {
    this.Id = id;
    this.Image = image;
    this.Name = name;
  }
}

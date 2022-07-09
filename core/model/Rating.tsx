export class Rating {
  Id: string;
  Body: string;
  Taste: string;
  Bitterness: string;
  Sourness: string;

  constructor(
    id: string,
    body: string,
    taste: string,
    bitterness: string,
    sourness: string,
  ) {
    this.Id = id;
    this.Body = body;
    this.Taste = taste;
    this.Bitterness = bitterness;
    this.Sourness = sourness;
  }
}

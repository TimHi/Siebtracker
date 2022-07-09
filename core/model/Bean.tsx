export class Bean {
  Id: string;
  Title: string;
  Desc: string;
  Producer: string;
  Image: string;
  constructor(
    id: string,
    title: string,
    desc: string,
    producer: string,
    image: string,
  ) {
    this.Id = id;
    this.Title = title;
    this.Desc = desc;
    this.Producer = producer;
    this.Image = image;
  }
}

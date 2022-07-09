export class Setting {
  Id: string;
  Ratio: string;
  ExtractionTime: string;
  CoarseWeight: string;
  ExtractedWeight: string;
  constructor(
    id: string,
    ratio: string,
    extractionTime: string,
    coarseWeight: string,
    extractedWeight: string,
  ) {
    this.Id = id;
    this.Ratio = ratio;
    this.ExtractionTime = extractionTime;
    this.CoarseWeight = coarseWeight;
    this.ExtractedWeight = extractedWeight;
  }
}

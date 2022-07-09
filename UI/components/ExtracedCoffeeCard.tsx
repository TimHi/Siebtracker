import React from 'react';
import {SafeAreaView} from 'react-native-safe-area-context';
import {Card} from 'react-native-ui-lib';
import {Coffee} from '../../core/model/Coffee';
import {Rating} from '../../core/model/Rating';

interface IExtractedCoffeeCardProps {
  coffee: Coffee;
  rating: Rating;
}

interface IExtractedCoffeeCardState {
  coffee: Coffee;
  rating: Rating;
}

export class ExtractedCoffeeCard extends React.Component<
  IExtractedCoffeeCardProps,
  IExtractedCoffeeCardState
> {
  constructor(props: IExtractedCoffeeCardProps) {
    super(props);
    this.state = {coffee: props.coffee, rating: props.rating};
  }
  componentDidMount() {
    console.log('Extracted Coffee did Mount');
  }

  static getDerivedStateFromProps(props: IExtractedCoffeeCardProps) {
    return {coffee: props.coffee, rating: props.rating};
  }

  render() {
    return (
      <SafeAreaView>
        <Card
          key={this.state.coffee.Id}
          backgroundColor="#f7c3a3"
          enableShadow={true}
          onPress={() =>
            console.log('Coffee: ' + this.state.rating.Id + ' pressed')
          }>
          <Card.Image
            height={50}
            width={50}
            source={{
              uri: 'https://cdn-icons-png.flaticon.com/512/590/590836.png',
            }}
          />
          <Card.Section
            content={[
              {
                text: 'Body: ',
                text70: true,
                grey10: true,
              },
              {text: this.state.rating.Body, text70: true, grey10: true},
              {
                text: 'Bitterness: ',
                text70: true,
                grey10: true,
              },
              {text: this.state.rating.Bitterness, text70: true, grey10: true},
              {
                text: 'Sourness: ',
                text70: true,
                grey10: true,
              },
              {text: this.state.rating.Sourness, text70: true, grey10: true},
              {
                text: 'Taste: ',
                text70: true,
                grey10: true,
              },
              {text: this.state.rating.Taste, text70: true, grey10: true},
            ]}
          />
        </Card>
      </SafeAreaView>
    );
  }
}

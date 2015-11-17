/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var {
  AppRegistry,
  StyleSheet,
  Image,
  Text,
  View,
} = React;

var test = React.createClass({
  render: function() {
    return (
      <View style={{backgroundColor:'black', flex: 1}}>
      <Image style={{flex:1}} source={{uri: 'http://facebook.github.io/react/img/logo_og.png'}} />
      <Text style={{color:'white', fontSize:40}}>React</Text>
      </View>
    );
  }
});

AppRegistry.registerComponent('test', () => test);

import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import { useFonts } from 'expo-font';



export default function App() {

  /*
  
  Fonts 
  
   */
  const [loaded] = useFonts({
    Montserrat: require('./assets/fonts/Montserrat.ttf'),
    SansitaBlack: require('./assets/fonts/Sansita-Black.ttf'),
    SansitaIt: require('./assets/fonts/Sansita-Italic.ttf'),
    SansitaReg: require('./assets/fonts/ScopeOne-Regular.ttf'),
    Shrikhand: require('./assets/fonts/Shrikhand-Regular.ttf'),
    ScopeOneReg: require('./assets/fonts/Shrikhand-Regular.ttf'),
  });

    if (!loaded) {
    return null;
  }




  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text style={{ fontFamily: 'SansitaBlack', fontSize: 44 }}>Vad händer</Text>
    </View>
  );
}
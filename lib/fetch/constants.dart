const apiKey1="2eeb25a8-c9fa-4fc8-94ba-fec9e261fb22";
const apiKey2="a9424fbc-479f-4ce3-b79e-f99b9dbc764e";

String fetchURL(String word,String apiKey){
  return "https://www.dictionaryapi.com/api/v3/references/collegiate/json/$word?key=$apiKey";
}

String fetchAudioURL(String audioName){
  return "https://media.merriam-webster.com/audio/prons/en/us/mp3/${audioName[0]}/$audioName.mp3";
}
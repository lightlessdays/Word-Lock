const apiKey1="we are removing the api key from here for privacy reasons";

String fetchURL(String word,String apiKey){
  return "https://www.dictionaryapi.com/api/v3/references/collegiate/json/$word?key=$apiKey";
}

String fetchAudioURL(String audioName){
  return "https://media.merriam-webster.com/audio/prons/en/us/mp3/${audioName[0]}/$audioName.mp3";
}

class Solution {
  String makeFancyString(String s) {
    List<String> str=s.split('');
    String char=str[0];
    int count=0;
    List<String> r=[];
    for(int i=0;i<str.length;i++){
        if(str[i]==char){
          count++;
        }else{
            char=str[i];
            count=1;
        }
        if(count==3){
           // str.removeAt(i);
           //i--;
            count--;
        }else{
            r.add(str[i]);
        }
    }return r.join();
  }
}

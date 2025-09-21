import java.util.*;

class MovieRentingSystem {

    HashMap<Integer,TreeSet<List<Integer>>> rentingSystem;
    TreeSet<List<Integer>> rentingSet;
    HashMap<String, Integer> priceMap;




    public MovieRentingSystem(int n, int[][] entries) {
        rentingSystem = new HashMap<>();
        priceMap = new HashMap<>();
        rentingSet = new TreeSet<>((a, b) -> {
            if(!Objects.equals(a.get(0), b.get(0))) 
            return a.get(0) - b.get(0);
            if(!Objects.equals(a.get(1), b.get(1))) 
            return a.get(1) - b.get(1);
            return a.get(2) - b.get(2);
        });

        for(int[] entry : entries){
            int shop = entry[0];
            int movie = entry[1];
            int price = entry[2];
            rentingSystem.putIfAbsent(movie, new TreeSet<>((a, b) -> {
                if(!Objects.equals(a.get(0), b.get(0))) return a.get(0) - b.get(0);
                return a.get(1) - b.get(1);
            }));
            rentingSystem.get(movie).add(List.of(price, shop));

            String key = shop + "-" + movie;
            priceMap.put(key, price) ;
        }


    }

    public List<Integer> search(int movie) {
        TreeSet<List<Integer>> set = rentingSystem.get(movie);
        List<Integer> result = new ArrayList<>();
        if(set == null) return result;
        if(set.size() < 5 ) {
            for (List<Integer> entry : set) {
                result.add(entry.get(1));
            }
        }
        else{
            int count = 0;
            for(List<Integer> entry : set){
                result.add(entry.get(1));
                count++;
                if(count == 5) break;
            }
        }

        return result;


    }

    public void rent(int shop, int movie) {

        TreeSet<List<Integer>> set = rentingSystem.get(movie);
        int price = priceMap.get(shop + "-" + movie);
        set.remove(List.of(price, shop));

        rentingSet.add(List.of(price, shop, movie));


    }

    public void drop(int shop, int movie) {
        int price = priceMap.get(shop + "-" + movie);
        rentingSet.remove(List.of(price, shop, movie));
        rentingSystem.get(movie).add(List.of(price, shop));

    }

    public List<List<Integer>> report() {
        List<List<Integer>> result = new ArrayList<>();
        int count = 0;

        for(List<Integer> entry : rentingSet){
            result.add(List.of(entry.get(1), entry.get(2)));
            count++;
            if(count == 5) break;
        }
        return result;
    }
}
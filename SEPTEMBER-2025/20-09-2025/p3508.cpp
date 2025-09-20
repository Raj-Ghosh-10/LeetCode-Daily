#include <bits/stdc++.h>
using namespace std;
struct Packet {
    int source, destination, timestamp;
};
struct KeyHash {
    size_t operator()(const tuple<int,int,int>& k) const {
        auto [s,d,t] = k;
        return ((size_t)s * 1315423911u) ^ ((size_t)d * 2654435761u) ^ (size_t)t;
    }
};
struct KeyEq {
    bool operator()(const tuple<int,int,int>& a, const tuple<int,int,int>& b) const {
        return a == b;
    }
};
class Router {
    int memoryLimit;
    queue<Packet> q;
    unordered_set<tuple<int,int,int>, KeyHash, KeyEq> seen;
    unordered_map<int, vector<int>> perDest; 
public:
    Router(int limit) : memoryLimit(limit) {}
    bool addPacket(int source, int destination, int timestamp) {
        tuple<int,int,int> key = {source, destination, timestamp};
        if (seen.count(key)) return false; 
        if ((int)q.size() == memoryLimit) {
            Packet old = q.front(); q.pop();
            seen.erase({old.source, old.destination, old.timestamp});
            auto &vec = perDest[old.destination];
            auto it = lower_bound(vec.begin(), vec.end(), old.timestamp);
            if (it != vec.end() && *it == old.timestamp) vec.erase(it);
            if (vec.empty()) perDest.erase(old.destination);
        }
        q.push({source, destination, timestamp});
        seen.insert(key);
        perDest[destination].push_back(timestamp); 
        return true;
    }
    vector<int> forwardPacket() {
        if (q.empty()) return {};
        Packet p = q.front(); q.pop();
        seen.erase({p.source, p.destination, p.timestamp});
        auto &vec = perDest[p.destination];
        auto it = lower_bound(vec.begin(), vec.end(), p.timestamp);
        if (it != vec.end() && *it == p.timestamp) vec.erase(it);
        if (vec.empty()) perDest.erase(p.destination);
        return {p.source, p.destination, p.timestamp};
    }
    int getCount(int destination, int startTime, int endTime) {
        if (!perDest.count(destination)) return 0;
        auto &vec = perDest[destination];
        auto it1 = lower_bound(vec.begin(), vec.end(), startTime);
        auto it2 = upper_bound(vec.begin(), vec.end(), endTime);
        return (int)(it2 - it1);
    }
};
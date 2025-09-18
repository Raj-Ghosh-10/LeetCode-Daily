class TaskManager {
        #define p pair<int,int>
         unordered_map<int,int>taskPrio;
    unordered_map<int,int>taskUser;
    priority_queue<p>pq;
public: 
    TaskManager(vector<vector<int>>& tasks) {
        for(int i=0;i<tasks.size();i++){
            int userId=tasks[i][0];
            int taskId=tasks[i][1];
            int priority=tasks[i][2];
            add(userId,taskId,priority);
        }
    }
    
    void add(int userId, int taskId, int priority) {
        taskPrio[taskId]=priority;
            taskUser[taskId]=userId;
            pq.push({priority,taskId});
    }
    
    void edit(int taskId, int newPriority) {
        taskPrio[taskId]=newPriority;
            pq.push({newPriority,taskId});
    }
    void rmv(int taskId) {
       taskPrio[taskId]=-1;
    }
    
    int execTop() {
        while(!pq.empty()){
            auto tp=pq.top();
            pq.pop();
            int prio=tp.first;
            int task=tp.second;
            if(taskPrio[task]==prio){
                taskPrio[task]=-1;
                return taskUser[task];
            }
        }
        return -1;
    }
};

/**
 * Your TaskManager object will be instantiated and called as such:
 * TaskManager* obj = new TaskManager(tasks);
 * obj->add(userId,taskId,priority);
 * obj->edit(taskId,newPriority);
 * obj->rmv(taskId);
 * int param_4 = obj->execTop();
 */
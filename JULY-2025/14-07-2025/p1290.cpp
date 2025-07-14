/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    int getDecimalValue(ListNode* head) {
        string str="";
        ListNode*curr = head;
        if(!head || !head->next)
        return head->val;
        while(curr){
            str += (curr->val+'0');
            curr = curr->next;
        }
         int len = str.length();
        int num=0;
        int pow = 1;
        for(int i=len-1;i>=0;i--){
            if(str[i]=='1')
            { num += pow;}
            pow *=2;
        }
        return num;
    }
};
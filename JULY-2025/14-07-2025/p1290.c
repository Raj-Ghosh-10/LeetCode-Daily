/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
int getDecimalValue(struct ListNode* head) {

   struct ListNode*ptr=head;
    int count=0;

    while(ptr!=NULL){
        count++;
        ptr=ptr->next;
    }

    int arr[count];
    int i=0;

    while(head!=NULL){
        arr[i]=head->val;
        head=head->next;
        i++;
    }

    int output=0;

    for(int i=0;i<count;i++){
        output+=arr[i]*(int)pow(2,count-i-1);
    }

    return output;
    
}
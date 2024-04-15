#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    int n;
    cin >> n;

    vector<int> arr(n);
    for (int i = 0; i < n; ++i) {
        cin >> arr[i];
    }

    // Sort the array to find the two smallest negative numbers
    sort(arr.begin(), arr.end());

    // If there are at least two negative numbers, change their signs
    if (arr[0] < 0 && arr[1] < 0) {
        arr[0] = -arr[0];
        arr[1] = -arr[1];
    }
else if(arr[0]<0) arr[0]=-arr[0];
    // Calculate the sum of the array
    long long sum = 0;
    for (int i = 0; i < n; ++i) {
        sum += arr[i];
    }

    cout << sum << endl;

    return 0;
}

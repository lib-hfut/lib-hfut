#include <cstdlib>
#include <iostream>
#include <sstream>
#include <vector>

using namespace std;

string itos(int a) {
	ostringstream os;
	os << a;
	return os.str();
}


class MatrixChain {
public:
	MatrixChain(vector<int> pp)
	  :p(pp), 
	  _m(pp.size()-1, pp.size()-1), 
	  _s(pp.size()-1, pp.size()-1) {}

	int length() {
		return p.size() - 1;
	}

	int m(int row, int col) {
		return _m[row - 1][col - 1];
	}

	int pos(int row, int col) {
		return _s[row - 1][col - 1];
	}

	void optimize() {
		for (int diagonal = 1; diagonal <= length() - 1; ++diagonal)
			for (int row = 1; row <= length() - diagonal; ++row)
				optimizeFor(row, row + diagonal);
	}

	string order(int i, int j) {
		if (i == j)
			return "A" + itos(i);
		else
			return "(" + order(i, pos(i, j)) + order(pos(i, j) + 1, j) + ")";
	}

private:
	void optimizeFor(int row, int col) {
		_m[row - 1][col - 1] = multiplications(row, row, col);
		_s[row - 1][col - 1] = row;
		for (int k = row + 1; k < col; ++k) {
			int count = multiplications(row, k, col);
			if (count < m(row, col)) {
				_m[row - 1][col - 1] = count;
				_s[row - 1][col - 1] = k;
			}
		}
	}

	int multiplications(int row, int breakpoint, int col) {
		int result = m(row, breakpoint) + m(breakpoint + 1, col)
				+ p[row - 1] * p[breakpoint] * p[col];
		return result;
	}

private: 
	vector<int> p;
	vector<vector<int> > _m;
	vector<vector<int> > _s;
};

class RecursiveMatrixChain {
public:
	RecursiveMatrixChain(vector<int> pp)
	  :p(pp),
	  _s(pp.size()-1, pp.size()-1) {
	}
	
	int m(int i, int j){
		if (i == j)
			return 0;
			
		int result = m(i, i)+ m(i+1, j) + p[i-1]*p[i]*p[j];
		_s[i-1][j-1] = i;
		
		for(int k=i+1; k<j; ++k) {
			int count = m(i, k) + m(k+1, j) + p[i-1]*p[k]*p[j];
			if(count < result) {
				result = count;
				_s[i-1][j-1] = k;
			}
		}
		return result;
	}
	
	string order(int i, int j) {
		if (i == j)
			return "A" + itos(i);
		else
			return "(" + order(i, pos(i, j)) + order(pos(i, j) + 1, j) + ")";
	}

	int pos(int row, int col) {
		return _s[row - 1][col - 1];
	}


private: 
	vector<int> p;
	vector<vector<int> > _s;
};

class LookupMatrixChain {
public:
	LookupMatrixChain(vector<int> pp)
	  :p(pp), 
	  _m(pp.size()-1, pp.size()-1), 
	  _s(pp.size()-1, pp.size()-1) {
	}
	
	int m(int row, int col) {
		return _m[row - 1][col - 1];
	}

	int pos(int row, int col) {
		return _s[row - 1][col - 1];
	}

	int lookup(int i, int j) {
		if( i==j ) return 0;
		if( m(i, j)>0 ) return m(i, j);
		
		int result = lookup(i, i)+ lookup(i+1, j) + p[i-1]*p[i]*p[j];
		_s[i-1][j-1] = i;
		
		for(int k=i+1; k<j; ++k) {
			int count = lookup(i, k) + lookup(k+1, j) + p[i-1]*p[k]*p[j];
			if(count < result) {
				result = count;
				_s[i-1][j-1] = k;
			}
		}
		_m[i-1][j-1] = result;
		return result;
	}
	
	string order(int i, int j) {
		if (i == j)
			return "A" + itos(i);
		else
			return "(" + order(i, pos(i, j)) + order(pos(i, j) + 1, j) + ")";
	}

private: 
	vector<int> p;
	vector<vector<int> > _m;
	vector<vector<int> > _s;
};


int main(int argc, char *argv[])
{
	int a[] = {30, 35, 15, 5, 10, 20, 25, 23, 12, 24, 45, 35, 36, 38,
	           4, 5, 6, 7, 90, 34, 45, 65, 34, 23, 45, 56, 65, 21, 60};
	const int len = sizeof(a)/sizeof(int);
	
	MatrixChain mc(vector<int>(a, a+len) );
	mc.optimize();
	cout << mc.m(1, len-1) << endl;
	cout << mc.order(1, len-1) << endl;

//	RecursiveMatrixChain rmc(vector<int>(a, a+len) );
//	cout << rmc.m(1, len-1) << endl;
//	cout << rmc.order(1, len-1) << endl;
	
	LookupMatrixChain lmc(vector<int>(a, a+len) );
	cout << lmc.lookup(1, len-1) << endl;
	cout << lmc.order(1, len-1)<< endl;

    system("PAUSE");
    return EXIT_SUCCESS;
}

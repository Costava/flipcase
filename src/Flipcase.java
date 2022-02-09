public class Flipcase {
	public static void main(String[] args) throws java.io.IOException {
		byte[] b = {0};
		while (true) {
			int numBytesRead = System.in.read(b, 0, 1);

			if (numBytesRead == -1) {
				break;
			}

			if (b[0] >= 'a' && b[0] <= 'z') {
				b[0] = (byte)(b[0] - 'a' + 'A');
			}
			else if (b[0] >= 'A' && b[0] <= 'Z') {
				b[0] = (byte)(b[0] - 'A' + 'a');
			}

			System.out.write(b, 0, 1);
		}
	}
}

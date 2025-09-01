import 'package:flutter/material.dart';
import '../../models/models.dart';

class ProductDetailDialog extends StatelessWidget {
  final Product product; // From Product model

  const ProductDetailDialog({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(product.name),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(Icons.error, size: 40),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Product Details Section
              _buildDetailRow(
                icon: Icons.category,
                label: 'Category',
                value: product.category,
              ),
              
              const SizedBox(height: 12),
              
              _buildDetailRow(
                icon: Icons.star,
                label: 'Rating',
                value: '${product.rating} / 5.0',
                iconColor: Colors.amber,
              ),
              
              const SizedBox(height: 12),
              
              _buildDetailRow(
                icon: Icons.attach_money,
                label: 'Price',
                value: '\$${product.price.toStringAsFixed(2)}',
                valueColor: Colors.green,
                valueStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Product ID (for reference)
              Text(
                'Product ID: ${product.id}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
        ElevatedButton(
          onPressed: () => _addToCart(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          child: const Text('Add to Cart'),
        ),
      ],
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    Color? iconColor,
    Color? valueColor,
    TextStyle? valueStyle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: iconColor ?? Colors.grey[600],
          size: 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: valueStyle ?? TextStyle(
                  fontSize: 16,
                  color: valueColor ?? Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _addToCart(BuildContext context) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text('Added ${product.name} to Cart'),
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Static method to show the dialog
  static Future<void> show(BuildContext context, Product product) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return ProductDetailDialog(product: product);
      },
    );
  }
}
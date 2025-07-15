document.addEventListener('DOMContentLoaded', function() {
    const discountForm = document.getElementById('discountForm');
    const discountInput = document.getElementById('discountCode');
    const discountFeedback = document.getElementById('discountFeedback');

    if (discountForm) {
        discountForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const discountCode = discountInput.value.trim();
            
            if (!discountCode) {
                showFeedback('Vui lòng nhập mã giảm giá', 'danger');
                return;
            }

            // Use fetch to submit the discount code
            fetch('shopping?action=applyDiscount', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                    'X-Requested-With': 'XMLHttpRequest'
                },
                body: `discountCode=${encodeURIComponent(discountCode)}`
            })
            .then(response => response.text())
            .then(html => {
                // Show the response in the feedback area
                discountFeedback.innerHTML = html;
            })
            .catch(error => {
                console.error('Error:', error);
                showFeedback('Có lỗi xảy ra. Vui lòng thử lại.', 'danger');
            });
        });
    }

    function showFeedback(message, type) {
        discountFeedback.innerHTML = `
            <div class="alert alert-${type} mt-2" role="alert">
                ${message}
            </div>
        `;
    }
}); 
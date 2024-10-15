#include <linux/module.h>
#include <linux/spi/spi.h>
#include <linux/kernel.h>

#define DRIVER_NAME "simple_spi_driver"

static int simple_spi_probe(struct spi_device *spi)
{
    pr_info("SPI device is probed: %s\n", spi->modalias);
    return 0;
}

static int simple_spi_remove(struct spi_device *spi)
{
    pr_info("SPI device is removed: %s\n", spi->modalias);
    return 0;
}

static const struct spi_device_id simple_spi_id_table[] = {
    { "simple_spi", 0 },
    { }
};
MODULE_DEVICE_TABLE(spi, simple_spi_id_table);

static struct spi_driver simple_spi_driver = {
    .driver = {
        .name = DRIVER_NAME,
        .owner = THIS_MODULE,
    },
    .probe = simple_spi_probe,
    .remove = simple_spi_remove,
    .id_table = simple_spi_id_table,
};

static int __init simple_spi_init(void)
{
    pr_info("Loading simple SPI driver\n");
    return spi_register_driver(&simple_spi_driver);
}

static void __exit simple_spi_exit(void)
{
    pr_info("Unloading simple SPI driver\n");
    spi_unregister_driver(&simple_spi_driver);
}

module_init(simple_spi_init);
module_exit(simple_spi_exit);

MODULE_AUTHOR("Your Name");
MODULE_DESCRIPTION("Simple SPI Driver");
MODULE_LICENSE("GPL");
